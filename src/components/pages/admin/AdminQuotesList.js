import React, { useState, useEffect, Fragment } from 'react';
import { Table, Input, Button, Checkbox, Drawer, Dropdown, Menu, Modal, DatePicker, Select, Upload, Form, Space } from 'antd'
import { useDispatch, useSelector } from 'react-redux';
import { getAllQuoteList, changeRfqStatus, acceptRejectQuote } from '../../../redux/actions/supplierRfqAction';
import { getProductList, getTaxCategoryList } from '../../../redux/actions/rfqAction';
import {
  EyeOutlined,
  EditOutlined
} from '@ant-design/icons';
import ViewQuoteModal from "../../ViewQuoteModal";
import ViewQuoteReviewModal from "../../ViewQuoteReviewModal";
//import { getAdminRfqLists } from '../../../redux/actions/rfqAction';
//import { getAllSupplier, getAllConsumer } from '../../../redux/actions/allDataAction';
//import { assignRfqToSupplier, resetAssignRfqStatus } from '../../../redux/actions/assignRfqAction';
import { getUserInfo } from '../../../redux/actions/userActions';
import SupplierPreviewModal from '../../SupplierPreviewModal';

const { Search } = Input;
const { confirm } = Modal;
const { Option } = Select;


const AdminQuotesList = ({ filter }) => {
  const dispatch = useDispatch();
  const [rfqList, setRfqList] = useState([])
  const { logindata } = useSelector((state) => state.auth);
  const { quoteAllData } = useSelector((state) => state.supplierRfq);
   const { productList, taxCategoryData } = useSelector((state) => state.rfq);
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
  const [open, setOpen] = React.useState(false);
  const [viewLoading, setViewLoading] = React.useState(false);
  const [currentRfqData, setCurrentRfqData] = React.useState({});
  const [isEdit, setIsEdit] = React.useState(false);
  const [isReview, setReview] = React.useState(false);

    const [currentViewedUser, setCurrentViewedUser] = useState(null);
  
    const token = useSelector((state) => state.auth.logindata.token);
    const userDetail = useSelector((state) => state.user.userDetail);
    const [isModalVisible, setIsModalVisible] = useState(false);
    const fileRootPath = 'https://factory.demosite.name/api';
  

  const showLoading = () => {
    setOpen(true);
    setViewLoading(true);

    setTimeout(() => {
      setViewLoading(false);
    }, 300);
  };

  useEffect(() => {
            if (token && currentViewedUser) {
              dispatch(getUserInfo(token, currentViewedUser));
            }
    // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [currentViewedUser]);

  useEffect(()=>{
    if(quoteAllData)
      setRfqList(quoteAllData.data || [])
  },[quoteAllData])

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

  const refreshList = () => {
    if (logindata && logindata.token) {
      dispatch(getAllQuoteList(logindata.token));
      dispatch(getProductList(logindata.token));
      dispatch(getTaxCategoryList(logindata.token))
    }
  };

  useEffect(() => {
    if (logindata && logindata.token) {
        dispatch(getAllQuoteList(logindata.token));
        dispatch(getProductList(logindata.token));
        dispatch(getTaxCategoryList(logindata.token))
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
      timeline: `${d?.timeline_val} ${d?.timeline_unit}`,
      validTill: d.valid_till,
      payment_term: d.payment_term,
      term_and_cond: d.term_and_cond,
      key: index,
      name: d.name,
      email: d.email,
      contact: d.mobile,
      manufacturingProcess: getManufacturingProcessValue(d.manufacturing_process_id),
      designFiles: d.is_design_file === "1" ? "Yes" : "No",
      comments: d.comments,
      files: d.files,
      files_review: d.files_review,
      status: d.status,
      accept_date: d.accept_date,
      quote_code: d.quote_code,
      addcomument: d.addcomument,
      commission_per: d.commission_per,
      total_tax: d.total_tax,
      total_amount: d.total_amount,
      total_amount_review: d.total_amount_review,
      tax_category: taxCategoryData?.data?.filter((tax)=>tax.id === d.tax_category)[0]?.tax_name,
      customer_details: <>
      <span>{d.customer_name}</span>
      <br />
      <span>{d.customer_email}</span>{" "}
      {d.customer_grade ? `(${d.customer_grade})` : ""}
    </>,
      supplier_details: <div style={{color: "#0000FF" , cursor: "pointer", textDecoration: "underline"}} onClick={() => { setCurrentViewedUser(d?.supplier_id); setIsModalVisible(true)}}>
      <span>{d.supplier_name}</span>
      <br />
      <span>{d.supplier_email}</span>{" "}
      {d.supplier_grade ? `(${d.supplier_grade})` : ""}
    </div>,
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
      const request = { quote_id: selectedRfq["id"], status: 1 }
      dispatch(acceptRejectQuote(logindata.token, request));
      setTimeout(()=>{
        dispatch(getAllQuoteList(logindata.token));
      },1500)
      
    }
  };

  const handleReject = (rfqId) => {
    confirm({
      title: 'Are you sure to Reject Quote?',
      onOk() {
        if (rfqId && rfqList) {
          const selectedRfq = rfqList.find(rf => rf.id === rfqId)
          const request = { quote_id: selectedRfq["id"], status: 0 }
          dispatch(acceptRejectQuote(logindata.token, request));
          setTimeout(()=>{
            dispatch(getAllQuoteList(logindata.token));
          },1500)
        }
      },
    });
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
      title: 'Quote ID',
      dataIndex: 'quote_code',
      key: 'quote_code',
    },

    {
      title: 'Customer Details',
      dataIndex: 'customer_details',
      key: 'customer_details',
    },

    {
      title: 'Timeline',
      dataIndex: 'timeline',
      key: 'timeline',
    },

    {
      title: 'Supplier Details',
      dataIndex: 'supplier_details',
      key: 'supplier_details',
    },

    {
      title: 'Valid Till',
      dataIndex: 'validTill',
      key: 'validTill',
    },
    {
      title: 'Payment Terms',
      dataIndex: 'payment_term',
      key: 'payment_term',
      ellipsis: true,
    },
    {
      title: 'Terms and Conditions',
      dataIndex: 'term_and_cond',
      key: 'term_and_cond',
      ellipsis: true,
    },
    {
          title: 'Action',
          key: 'action',
          render: (_, record) => (
            <div>
                <> 
                {record?.status === null &&<Button
                    type="primary"
                    style={{ borderColor: 'white', color:'white',  width: "80px", marginRight: '8px' , width: "100px"}}
                    onClick={() => {
                      setIsEdit(false);
                      setReview(true);
                      showLoading();
                      setCurrentRfqData({...record})
                    }}
                  >
                    Review <EyeOutlined/>
                  </Button>}
                  {record?.status === null ?
                   <Fragment>
                  <Button
                    type="primary"
                    onClick={() => {
                      //setCurrentRfqId(record.rfq_id);
                      handleAccept(record.rfq_id);
                    }}
                    // style={{ marginRight: '8px' }}
                    style={{ backgroundColor: '#2E6F40', borderColor: 'white',marginRight: '8px' , width: "100px"}}
                  >
                    Accept
                  </Button>
                  <Button
                    type="danger"
                    style={{ backgroundColor: '#E32227', borderColor: 'white', color:'white', marginRight: '8px',  width: "100px" }}
                    onClick={() => {
                      handleReject(record.rfq_id);
                    }}
                  >
                    Reject
                  </Button></Fragment> : <Fragment><span  style={{ color:`${record?.status === '1' ? `green` : `red`}`}}>{record?.status === '1' ? `Accepted` : `Rejected`} on {record?.accept_date}</span></Fragment> }
                </>
            </div>
          ),
    },
    {
          title: 'View / Edit',
          key: 'view_edit',
          render: (_, record) => (
            <div>
                <> 
                  <Button
                    type="primary"
                    style={{ borderColor: 'white', color:'white',  width: "80px" }}
                    onClick={() => {
                      setIsEdit(false);
                      setReview(false);
                      showLoading();
                      setCurrentRfqData({...record})
                    }}
                  >
                    View <EyeOutlined/>
                  </Button>
                  <Button
                    type="primary"
                    style={{ borderColor: 'white', color:'white', width: "80px" }}
                    onClick={() => {
                      setIsEdit(true);
                      setReview(false);
                      showLoading();
                      setCurrentRfqData({...record})
                    }}
                  >
                    Edit <EditOutlined/>
                  </Button>
                </>
            </div>
          ),
      },
  ];


  return (
    <div>
      <h1 style={{ marginBottom: '20px' }}>Quote List</h1>
      <ViewQuoteModal currentRfqData={currentRfqData} open={open} setOpen={setOpen} viewLoading={viewLoading} setViewLoading={setViewLoading} productList={productList} isEdit={isEdit} isReview={isReview} refreshList={refreshList}/>
      {/* <ViewQuoteReviewModal currentRfqData={currentRfqData} open={open} setOpen={setOpen} viewLoading={viewLoading} setViewLoading={setViewLoading} productList={productList} isEdit={isEdit}/> */}
      <Space style={{ marginBottom: 16, gap: 16 , flexWrap: 'wrap'}}>
        <Search
          placeholder="Search by RFQ Code/ Email / Name / Contact"
          onChange={(e)=> setSearchValue(e.target?.value)}
          style={{ width: 300 }}
          value={searchValue}
        />
        {/* <Select placeholder="--Manufacturing Process--"  style={{ minWidth: 200 }} onSelect={(value) => setFilters({ ...filters, manufacturingProcess: value })} value={filters?.manufacturingProcess} >
                  {manufacturingProcess.map((process) => (
                    <Option key={process.id} value={process.process_name} >{process.process_name}</Option>
                  ))}
        </Select>
        <Select placeholder="--Design Files--" style={{ minWidth: 100 }} onSelect={(value)=>setFilters({...filters, designFiles:value})} value={filters?.designFiles}>
          <Option value="yes">Yes</Option>
          <Option value="no">No</Option>
        </Select> */}
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
      {/* <Drawer
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
      </Drawer> */}
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
          {/* <Input.Group compact>
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
          </Input.Group> */}
         <DatePicker
            style={{ width: '100%' }}
            value={formData.valid_till}
            onChange={(date) => handleFormChange('duration', date)}
          />
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
      <SupplierPreviewModal
              isModalVisible={isModalVisible}
              setIsModalVisible={setIsModalVisible}
              userDetail={userDetail}
              fileRootPath={fileRootPath}
              manufacturingProcess={manufacturingProcess}
          />
    </div>
  );
};

export default AdminQuotesList;
