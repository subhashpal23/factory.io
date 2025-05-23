import React, { useState, useEffect } from 'react';
import { Table, Input, Button, Checkbox, Drawer, Menu, Modal, Select, Space } from 'antd';
import { useDispatch, useSelector } from 'react-redux';
import { getSupplierRfqReceivedList, changeRfqStatus } from '../../../redux/actions/supplierRfqAction';
import { getProductList } from '../../../redux/actions/rfqAction';
import {
  EyeOutlined
} from '@ant-design/icons';
import ViewRFQModal from "./../../ViewRFQModal";
//import { getAdminRfqLists } from '../../../redux/actions/rfqAction';
//import { getAllSupplier, getAllConsumer } from '../../../redux/actions/allDataAction';
//import { assignRfqToSupplier, resetAssignRfqStatus } from '../../../redux/actions/assignRfqAction';
const { Search } = Input;
const { confirm } = Modal;
const { Option } = Select;


const RfqReceived = ({ filter }) => {
  const dispatch = useDispatch();
  const [rfqList, setRfqList] = useState([])
  const { logindata } = useSelector((state) => state.auth);
  const { rfqReceivedData } = useSelector((state) => state.supplierRfq);
   const { productList } = useSelector((state) => state.rfq);
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

  const [open, setOpen] = React.useState(false);
  const [viewLoading, setViewLoading] = React.useState(false);
  const [currentRfqData, setCurrentRfqData] = React.useState({});
  const showLoading = () => {
    setOpen(true);
    setViewLoading(true);

    setTimeout(() => {
      setViewLoading(false);
    }, 300);
  };

  useEffect(()=>{
    if(rfqReceivedData)
      setRfqList(rfqReceivedData.data || [])
  },[rfqReceivedData])

  useEffect(()=>{
    if(rfqAssignStatus){
      setTimeout(() => {
        setDrawerVisible(false);
        setSelectedUsers([]);
        setUserSearchValue('');
        //dispatch(resetAssignRfqStatus())  
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
        dispatch(getSupplierRfqReceivedList(logindata.token));
        dispatch(getProductList(logindata.token));
     // dispatch(getAllConsumer(logindata.token));
    //  dispatch(getAllSupplier(logindata.token));
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
      files: d.files,
      member_id: d.member_id,
      grade: d.grade,
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
     // dispatch(assignRfqToSupplier(request, logindata.token))
    }
  };

  const handleAccept = (rfqId) => {
    if (rfqId && rfqList) {
      const selectedRfq = rfqList.find(rf => rf.id === rfqId)
      const request = { rfq_id: selectedRfq["id"], rfq_code: selectedRfq["rfq_code"], status: 'accept' }
      dispatch(changeRfqStatus(logindata.token, request));
      setTimeout(()=>{
        dispatch(getSupplierRfqReceivedList(logindata.token));
      },1500)
      
    }
  };

  const handleReject = (rfqId) => {
    confirm({
      title: 'Are you sure to Reject RFQ?',
      onOk() {
        if (rfqId && rfqList) {
          const selectedRfq = rfqList.find(rf => rf.id === rfqId)
          const request = { rfq_id: selectedRfq["id"], rfq_code: selectedRfq["rfq_code"], status: 'reject' }
          dispatch(changeRfqStatus(logindata.token, request));
          setTimeout(()=>{
            dispatch(getSupplierRfqReceivedList(logindata.token));
          },1500)
        }
      },
    });
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
      title: 'Consumer UID',
      dataIndex: 'member_id',
      key: 'member_id',
    },
    {
      title: 'Grade',
      dataIndex: 'grade',
      key: 'grade',
    },
    /*{
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
    },*/
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
        <div>
          {!filter && (
            <>
              {/* Accept RFQ Button */}
              <Button
                type="primary"
                onClick={() => {
                  //setCurrentRfqId(record.rfq_id);
                  handleAccept(record.rfq_id);
                }}
                // style={{ marginRight: '8px' }}
                style={{ backgroundColor: '#2E6F40', borderColor: 'white',marginRight: '8px' }}
              >
                Accept RFQ
              </Button>
              {/* Reject RFQ Button */}
              <Button
                type="danger"
                style={{ backgroundColor: '#E32227', borderColor: 'white', color:'white', marginRight: '8px' }}
                onClick={() => {
                  handleReject(record.rfq_id);
                }}
              >
                Reject RFQ
              </Button>
              <Button
                type="primary"
                style={{ borderColor: 'white', color:'white' }}
                onClick={() => {
                  showLoading();
                  setCurrentRfqData({...record})
                }}
              >
                View <EyeOutlined/>
              </Button>
            </>
          )}
        </div>
      ),
    },
  ];


  return (
    <div>
      <h1 style={{ marginBottom: '20px' }}>Rfq List</h1>
      <ViewRFQModal currentRfqData={currentRfqData} open={open} setOpen={setOpen} viewLoading={viewLoading} setViewLoading={setViewLoading} productList={productList}/>
      <Space style={{ marginBottom: 16, gap: 16 , flexWrap: 'wrap'}}>
        <Search
          placeholder="Search by RFQ Code/ Email / Name / Contact"
          onChange={(e)=> setSearchValue(e.target?.value)}
          style={{ width: 270 }}
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
      <div style={{ overflowX: 'auto' }}>
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
      </div>
      <Drawer
        title={drawerTitle}
        width={500}
        onClose={closeDrawer}
        visible={drawerVisible}
        bodyStyle={{ paddingBottom: 80 }}
      >
        <h2 style={{margin:"0px 10px 10px 0px"}}>{currentRfqCode}</h2>
        <Search
          placeholder="Search users"
          onSearch={handleUserSearch}
          style={{ marginBottom: 20 }}
          value={userSearchValue}
          onChange={(e) => handleUserSearch(e.target.value)}
        />
        <div style={{ maxHeight: 'calc(100vh - 200px)', overflowY: 'auto' }}>
        {filteredUserList.map((user) => (
          <div key={user.id} style={{ display: 'flex', padding: '10px', borderBottom: '1px solid #ccc', alignItems: 'center' }}>
            <Checkbox
              checked={selectedUsers.includes(user.id)}
              onChange={() => handleUserSelect(user.id)}
              style={{ marginRight: '10px' }}
            />
            <div style={{ display: 'flex', justifyContent: 'space-between', width: '100%' }}>
              <span style={{ flex: '1' }}>{user.name}</span>
              <span style={{ flex: '1', textAlign: 'right' }}>{user.email}</span>
            </div>
          </div>
        ))}
        </div>
        <Button
          type="primary"
          onClick={handleAssignAndSave}
          style={{ position: 'absolute', right: 20, bottom: 20 }}
        >
          Assign and Save
        </Button>
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

export default RfqReceived;
