import React, { useState, useEffect } from 'react';
import { Table, Input, Button, Checkbox, Drawer, Dropdown, Menu, Modal } from 'antd';
import { useDispatch, useSelector } from 'react-redux';
import { getSupplierRfqReceivedList, changeRfqStatus } from '../../../redux/actions/supplierRfqAction';
//import { getAdminRfqLists } from '../../../redux/actions/rfqAction';
//import { getAllSupplier, getAllConsumer } from '../../../redux/actions/allDataAction';
//import { assignRfqToSupplier, resetAssignRfqStatus } from '../../../redux/actions/assignRfqAction';
const { Search } = Input;
const { confirm } = Modal;



const RfqReceived = ({ filter }) => {
  const dispatch = useDispatch();
  const [rfqList, setRfqList] = useState([])
  const { logindata } = useSelector((state) => state.auth);
  const { rfqReceivedData } = useSelector((state) => state.supplierRfq);
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
  
  
  //let rfqList = rfqReceivedData && rfqReceivedData?.data ? rfqReceivedData.data : [];
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
     // dispatch(getAllConsumer(logindata.token));
    //  dispatch(getAllSupplier(logindata.token));
    }
  }, [dispatch, logindata]);

  useEffect(() => {
    if (rfqList && rfqList.length > 0) {
      fetchData();
    }
  }, [rfqList, pagination.current, pagination.pageSize, sortOrder, searchValue]);

  const getManufacturingProcessValue = (id) => {
    const process = manufacturingProcess.find((d) => d.id === id);
    return process?.process_name || '';
  };

  const fetchData = () => {
    setLoading(true);
    const data = rfqList.map((d, index) => {
      return {
        rfq_id: d.id,
        rfqcode: d.rfq_code,
        key: index,
        name: d.name,
        email: d.email,
        contact: d.mobile,
        manufacturingProcess: getManufacturingProcessValue(d.manufacturing_process_id),
        designFiles: d.is_design_file === '1' ? 'Yes' : 'No',
        comments: d.comments,
      };
    });

    const filtered = searchValue
      ? data.filter(
        (item) => item.email.includes(searchValue) || item.contact.includes(searchValue)
      )
      : data;

    const sortedData = sortOrder
      ? filtered.sort((a, b) => {
        if (a[sortOrder.columnKey] < b[sortOrder.columnKey])
          return sortOrder.order === 'ascend' ? -1 : 1;
        if (a[sortOrder.columnKey] > b[sortOrder.columnKey])
          return sortOrder.order === 'ascend' ? 1 : -1;
        return 0;
      })
      : filtered;

    const start = (pagination.current - 1) * pagination.pageSize;
    const end = start + pagination.pageSize;
    const pageData = sortedData.slice(start, end);

    setFilteredData(pageData);
    setPagination({ ...pagination, total: filtered.length });
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
                style={{ backgroundColor: '#E32227', borderColor: 'white', color:'white' }}
                onClick={() => {
                  //setCurrentRfqId(record.rfq_id);
                  handleReject(record.rfq_id);
                }}
              >
                Reject RFQ
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
