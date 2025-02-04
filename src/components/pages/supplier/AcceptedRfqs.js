import React, { useState, useEffect } from 'react';
import { Table, Input, Button, Checkbox, Drawer, Dropdown, Menu, Modal, DatePicker, Select, Upload, Form, Space } from 'antd';
import { useDispatch, useSelector } from 'react-redux';
import { getAdminRfqLists } from '../../../redux/actions/rfqAction';
import { getAllSupplier, getAllConsumer } from '../../../redux/actions/allDataAction';
import { assignRfqToSupplier, resetAssignRfqStatus } from '../../../redux/actions/assignRfqAction';
const { Search } = Input;
const { confirm } = Modal;
const { Option } = Select;
const AcceptedRfqs = ({ filter }) => {
  const dispatch = useDispatch();
  const { logindata } = useSelector((state) => state.auth);
  const { adminRfqData } = useSelector((state) => state.rfq);
  const allSupplier = useSelector((state) => state.dataSet.allSupplier);
  const allConsumer = useSelector((state) => state.dataSet.allConsumer);
  const manufacturingProcess = useSelector((state) => state.auth.logindata.manufacturing_process);
  const rfqAssignStatus = useSelector((state)=> state.assignRfq.assignStatus)
  const [filteredData, setFilteredData] = useState([]);
  const [searchValue, setSearchValue] = useState('');
  const [pagination, setPagination] = useState({
    current: 1,
    pageSize: 12,
    total: 0,
  });
  const [sortOrder, setSortOrder] = useState(null);
  const [loading, setLoading] = useState(false);
  const [drawerVisible, setDrawerVisible] = useState(false);
  const [selectedUsers, setSelectedUsers] = useState([]);
  const [userSearchValue, setUserSearchValue] = useState('');
  const [drawerTitle, setDrawerTitle] = useState('');
  const [drawarActiveDataSet, setDrawerActiveDataSet] = useState('');
  const [userList, setUserList] = useState([]);
  const [currentRfqCode, setCurrentRfqCode] = useState('');
  const [currentRfqId,setCurrentRfqId] = useState('');
  const [ filters, setFilters] = useState({})
  
  const [formData, setFormData] = useState({
    total_cost: '',
    valid_till: null,
    duration_year: '',
    duration_month: '',
    duration_day: '',
    documents: [],
    payment_term: '',
  });


  let rfqList = adminRfqData && adminRfqData?.data ? adminRfqData.data : [];
  console.log('@rfqList',rfqList)
  useEffect(()=>{
    if(rfqAssignStatus){
      setTimeout(() => {
        setDrawerVisible(false);
        setSelectedUsers([]);
        setUserSearchValue('');
        dispatch(resetAssignRfqStatus())  
      }, 2000);
    }
  },[rfqAssignStatus])

  useEffect(() => {
    if (drawarActiveDataSet === 'consumer' && allConsumer && allConsumer.length) {
      setUserList(allConsumer);
    }

    if (drawarActiveDataSet === 'supplier' && allSupplier && allSupplier.length) {
      setUserList(allSupplier);
    }

  }, [allSupplier, allConsumer, drawarActiveDataSet]);

  useEffect(() => {
    if (logindata && logindata.token) {
      dispatch(getAdminRfqLists(logindata.token));
      dispatch(getAllConsumer(logindata.token));
      dispatch(getAllSupplier(logindata.token));
    }
  }, [dispatch, logindata]);

  useEffect(() => {
    if (rfqList && rfqList.length > 0) {
      fetchData();
    }
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [rfqList, pagination.current, pagination.pageSize, sortOrder, searchValue, filters]);

  const getManufacturingProcessValue = (id) => {
    const process = manufacturingProcess.find((d) => d.id === id);
    return process?.process_name || '';
  };


  const handleFormChange = (key, value) => {
    setFormData({
      ...formData,
      [key]: value,
    });
  };

  const handleReset = () => {
    setFormData({
      total_cost: '',
      valid_till: null,
      duration_year: '',
      duration_month: '',
      duration_day: '',
      documents: [],
      payment_term: '',
    });
  };

  const handleSubmit = () => {
    console.log('Form Data:', formData);
  };


  const fetchData = () => {
    setLoading(true);
    const data = rfqList.map((d, index) => ({
      rfq_id: d.id,
      rfqcode: d.rfq_code,
      key: index,
      name: d.name,
      email: d.email,
      contact: d.mobile,
      manufacturingProcess: getManufacturingProcessValue(d.manufacturing_process_id),
      designFiles: d.is_design_file === "1" ? "Yes" : "No",
      comments: d.comments,
    }));
  
    const lowerCaseSearchValue = searchValue ? searchValue.toString().toLowerCase() : "";
  
    const filteredData = data.filter((item) => {
      const matchesSearch = lowerCaseSearchValue
        ? item.email?.toLowerCase().includes(lowerCaseSearchValue) ||
          item.contact?.includes(lowerCaseSearchValue) ||
          item.rfqcode?.toLowerCase().includes(lowerCaseSearchValue) ||
          item.name?.toLowerCase().includes(lowerCaseSearchValue)
        : true;
  
      const matchesManufacturingProcess = filters.manufacturingProcess
        ? item.manufacturingProcess === filters.manufacturingProcess
        : true;
  
      const matchesDesignFiles = filters.designFiles?.toLowerCase
        ? item.designFiles?.toLowerCase() === filters.designFiles?.toLowerCase()
        : true; 
  
      return matchesSearch && matchesManufacturingProcess && matchesDesignFiles;
    });
  
    const sortedData = sortOrder
      ? [...filteredData].sort((a, b) => {
          const columnKey = sortOrder.columnKey;
          const aValue = a[columnKey] ?? ""; // Ensure undefined values don't cause issues
          const bValue = b[columnKey] ?? "";
  
          return sortOrder.order === "ascend"
            ? aValue.localeCompare(bValue, undefined, { numeric: true })
            : bValue.localeCompare(aValue, undefined, { numeric: true });
        })
      : filteredData;
  
    const start = (pagination.current - 1) * pagination.pageSize;
    const end = start + pagination.pageSize;
    const pageData = sortedData.slice(start, end);

    setFilteredData(pageData);
    setPagination((prev) => ({
      ...prev,
      total: filteredData.length,
    }));
  
    setLoading(false);
  };

  const handleSearch = (value) => {
    setSearchValue(value);
    setPagination({ ...pagination, current: 1 });
  };

  const handleTableChange = (pagination, filters, sorter) => {
    setPagination(pagination);
    setSortOrder(sorter);
  };

  const showDrawer = (title, dataset, rfqCode, rfqId ) => {
    if(dataset==='supplier'){ 
      setDrawerTitle(title);
      setDrawerVisible(true);
      setDrawerActiveDataSet(dataset);
      setCurrentRfqCode(rfqCode);
      setCurrentRfqId(rfqId)
    }
  };

  const closeDrawer = () => {
    confirm({
      title: 'Are you sure you want to leave?',
      content: 'Changes you made may not be saved.',
      onOk() {
        setDrawerVisible(false);
        setSelectedUsers([]);
        setUserSearchValue('');
      },
    });
  };

  const handleUserSearch = (value) => {
    setUserSearchValue(value);
  };

  const handleUserSelect = (userId) => {
    setSelectedUsers((prevSelectedUsers) =>
      prevSelectedUsers.includes(userId)
        ? prevSelectedUsers.filter((id) => id !== userId)
        : [...prevSelectedUsers, userId]
    );
  };

  const handleAssignAndSave = () => {
    console.log('Assigned users:', selectedUsers);
    const request = {
      rfq_id : currentRfqId,
      rfq_code: currentRfqCode,
      supplier_id: selectedUsers
    }
    if(request && request?.rfq_id && request?.rfq_code && request?.supplier_id && request.supplier_id.length){
      dispatch(assignRfqToSupplier(request, logindata.token))
    }
  };

  const filteredUserList = userSearchValue
    ? userList.filter((user) =>
      user.name.toLowerCase().includes(userSearchValue.toLowerCase()) ||
      user.email.toLowerCase().includes(userSearchValue.toLowerCase())
    )
    : userList;

  const menu = (record) => (
    <Menu>
      <Menu.Item key="supplier" onClick={() => showDrawer('Assign to Supplier', 'supplier', record.rfqcode, record.rfq_id)}>
        Assign to Supplier
      </Menu.Item>
      <Menu.Item key="consumer" onClick={() => showDrawer('Assign to Consumer', 'consumer', record.rfqcode, record.rfq_id)}>
        Assign to Consumer
      </Menu.Item>
    </Menu>
  );

  const columns = [
    {
      title: 'RFQ Code',
      dataIndex: 'rfqcode',
      key: 'rfqcode',
    },
    {
      title: 'Name',
      dataIndex: 'name',
      key: 'name',
    },
    {
      title: 'Email',
      dataIndex: 'email',
      key: 'email',
    },
    {
      title: 'Contact',
      dataIndex: 'contact',
      key: 'contact',
    },
    {
      title: 'Manufacturing Process',
      dataIndex: 'manufacturingProcess',
      key: 'manufacturingProcess',
    },
    {
      title: 'Design Files',
      dataIndex: 'designFiles',
      key: 'designFiles',
    },
    {
      title: 'Comments',
      dataIndex: 'comments',
      key: 'comments',
    },
    {
      title: 'Action',
      key: 'action',
      render: (_, record) => (
        <>
            {!filter && <Button type="primary" onClick={() => showDrawer('Generate Quote', 'supplier', record.rfqcode, record.rfq_id)} > Generate Quote</Button>}
        </>
        // <Dropdown overlay={menu(record)} trigger={['hover']}>
          
        // </Dropdown>
      ),
    },
  ];

  return (
    <div>
      <h1 style={{ marginBottom: '20px' }}>Rfq List</h1>
      <Space style={{ marginBottom: 16, gap: 16 }}>
        <Search
          placeholder="Search by RFQ Code/ Email / Name / Contact"
          onChange={(e)=> setSearchValue(e.target?.value)}
          style={{ width: 300 }}
          value={searchValue}
        />
        <Select placeholder="--Manufacturing Process--"  style={{ minWidth: 200 }} onSelect={(value) => setFilters({ ...filters, manufacturingProcess: value })} value={filters?.manufacturingProcess} >
                  {manufacturingProcess.map((process) => (
                    <Option key={process.id} value={process.process_name} >{process.process_name}</Option>
                  ))}
        </Select>
        <Select placeholder="--Design Files--" style={{ minWidth: 100 }} onSelect={(value)=>setFilters({...filters, designFiles:value})} value={filters?.designFiles}>
          <Option value="yes">Yes</Option>
          <Option value="no">No</Option>
        </Select>
        <Button
            type="primary"
            onClick={()=>{setSearchValue(""); setFilters({})}}
            style={{ display: 'block', margin: '0 auto' }}
          >
            Reset
          </Button>
      </Space>
      <Table
        columns={columns}
        dataSource={filteredData}
        pagination={pagination}
        loading={loading}
        onChange={handleTableChange}
        rowClassName={(record, index) =>
          index % 2 === 0 ? 'table-row-light' : 'table-row-dark'
        }
      />
      <Drawer
        title={drawerTitle}
        width={500}
        onClose={closeDrawer}
        visible={drawerVisible}
        bodyStyle={{ paddingBottom: 80 }}
      >
        <h2 style={{margin:"0px 10px 10px 0px"}}>{`RFQ Code  :  ${currentRfqCode}`}</h2>
        <div style={{ textAlign: 'right', marginBottom: '10px' }}>
            <Button type="link" onClick={handleReset}>Reset Fields</Button>
      </div>
        <Form layout="vertical">
        <Form.Item label="Cost" required>
          <Input
            type="number"
            value={formData.total_cost}
            onChange={(e) => handleFormChange('total_cost', e.target.value)}
          />
        </Form.Item>
        <Form.Item label="Valid Upto">
          <DatePicker
            style={{ width: '100%' }}
            value={formData.valid_till}
            onChange={(date) => handleFormChange('valid_till', date)}
          />
        </Form.Item>
        <Form.Item label="Duration">
          <Input.Group compact>
            <Select
              placeholder="Year"
              style={{ width: '33%' }}
              value={formData.duration_year}
              onChange={(value) => handleFormChange('duration_year', value)}
            >
              {Array.from({ length: 10 }, (_, i) => (
                <Option key={i} value={i + 1}>{`${i + 1} Year${i > 0 ? 's' : ''}`}</Option>
              ))}
            </Select>
            <Select
              placeholder="Month"
              style={{ width: '33%' }}
              value={formData.duration_month}
              onChange={(value) => handleFormChange('duration_month', value)}
            >
              {Array.from({ length: 12 }, (_, i) => (
                <Option key={i} value={i}>{`${i + 1} Month${i > 0 ? 's' : ''}`}</Option>
              ))}
            </Select>
            <Select
              placeholder="Day"
              style={{ width: '33%' }}
              value={formData.duration_day}
              onChange={(value) => handleFormChange('duration_day', value)}
            >
              {Array.from({ length: 31 }, (_, i) => (
                <Option key={i} value={i + 1}>{`${i + 1} Day${i > 0 ? 's' : ''}`}</Option>
              ))}
            </Select>
          </Input.Group>
        </Form.Item>
        <Form.Item label="Documents">
          <Upload
            multiple
            beforeUpload={() => false} // Prevent automatic upload
            fileList={formData.documents}
            onChange={({ fileList }) => handleFormChange('documents', fileList)}
          >
            <Button>Upload</Button>
          </Upload>
        </Form.Item>
        <Form.Item label="Payment Term">
          <Input
            value={formData.payment_term}
            onChange={(e) => handleFormChange('payment_term', e.target.value)}
          />
        </Form.Item>
        {/* <Button type="primary" onClick={handleSubmit} style={{ position: 'absolute', right: 20, bottom: 20 }}>
          Generate Quote
        </Button> */}
        <Form.Item>
          <Button
            type="primary"
            onClick={handleSubmit}
            style={{ display: 'block', margin: '0 auto' }}
          >
            Generate Quote
          </Button>
        </Form.Item>
      </Form>
      </Drawer>
      <style>
        {`
          .table-row-light {
            background-color: #e0f7fa; /* Light cyan */
          }
          .table-row-dark {
            background-color: #ffffff; /* White */
          }
        `}
      </style>
    </div>
  );
};

export default AcceptedRfqs;
