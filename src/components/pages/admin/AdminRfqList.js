import React, { useState, useEffect } from 'react';
import { Table, Input, Button, Checkbox, Drawer, Dropdown, Menu, Modal, Select, Space, Typography } from 'antd';
import { useDispatch, useSelector } from 'react-redux';
import { getAdminRfqLists } from '../../../redux/actions/rfqAction';
import { getAllSupplier, getAllConsumer } from '../../../redux/actions/allDataAction';
import { assignRfqToSupplier, resetAssignRfqStatus } from '../../../redux/actions/assignRfqAction';
import { CountryCodes } from '../../Registration/constants';
import { getUserInfo } from '../../../redux/actions/userActions';
import SupplierPreviewModal from '../../SupplierPreviewModal';
// import {
//   EyeOutlined, 
// } from '@ant-design/icons';
const { Search } = Input;
const { confirm } = Modal;
const { Option } = Select;
const { Text } = Typography;

const AdminRfqList = ({ filter }) => {
  const dispatch = useDispatch();
  const { logindata } = useSelector((state) => state.auth);
  const token = useSelector((state) => state.auth.logindata.token);
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
  const [userSearchCountry, setUserSearchCountry] = useState('');
  const [userSearchManufacturing, setUserSearchManufacturing] = useState('');
  const [drawerTitle, setDrawerTitle] = useState('');
  const [drawarActiveDataSet, setDrawerActiveDataSet] = useState('');
  const [userList, setUserList] = useState([]);
  const [currentRfqCode, setCurrentRfqCode] = useState('');
  const [currentRfqId,setCurrentRfqId] = useState('');
  const [ filters, setFilters] = useState({})
  const [currentViewedUser, setCurrentViewedUser] = useState(null);

  const userDetail = useSelector((state) => state.user.userDetail);
  const [isModalVisible, setIsModalVisible] = useState(false);
  const fileRootPath = 'https://factory.demosite.name/api';

  let rfqList = adminRfqData && adminRfqData?.data ? adminRfqData.data : [];
  //console.log('@rfqList',rfqList)
  
  useEffect(() => {
          if (token && currentViewedUser) {
            dispatch(getUserInfo(token, currentViewedUser));
          }
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [currentViewedUser]);

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

  const fetchData = () => {
    setLoading(true);
    const data = rfqList.map((d, index) => ({
      rfq_id: d.id,
      rfqcode: d.rfq_code,
      key: index,
      name: d.name,
      email: <div>
                <Text>{d.email}</Text>
                   <br />
                <Text>({d.mobile})</Text>
            </div>,
      contact: d.mobile,
      manufacturingProcess: getManufacturingProcessValue(d.manufacturing_process_id),
      designFiles: d.is_design_file === "1" ? "Yes" : "No",
      comments: d.comments,
      grade: d.grade,
      memberId: d.member_id,
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

  // const filteredUserList = userSearchValue
  //   ? userList.filter((user) =>
  //     user.name.toLowerCase().includes(userSearchValue.toLowerCase()) ||
  //     user.email.toLowerCase().includes(userSearchValue.toLowerCase())
  //   )
  //   : userList;

  console.log("@@userSearchCountry", userSearchCountry);
  console.log("@@userSearchManufacturing", userSearchManufacturing);
  const filteredUserList = userList?.filter((user) => {
    const matchesSearchValue =
      userSearchValue &&
      (user.name.toLowerCase().includes(userSearchValue.toLowerCase()) ||
        user.email.toLowerCase().includes(userSearchValue.toLowerCase()));
  
    const matchesCountry =
      userSearchCountry && user.country_code?.toLowerCase().includes(userSearchCountry.toLowerCase());
  
    const matchesManufacturing =
      userSearchManufacturing &&
      user.manufacturing_process?.includes(userSearchManufacturing?.toLowerCase());
  
    return (
      (!userSearchValue || matchesSearchValue) &&
      (!userSearchCountry || matchesCountry) &&
      (!userSearchManufacturing || matchesManufacturing)
    );
  });

    console.log('@@userList', userList)

  const menu = (record) => (
    <Menu>
      <Menu.Item key="supplier" onClick={() => showDrawer('Assign to Supplier', 'supplier', record.rfqcode, record.rfq_id)}>
        Assign to Supplier
      </Menu.Item>
      {/* <Menu.Item key="consumer" onClick={() => showDrawer('Assign to Consumer', 'consumer', record.rfqcode, record.rfq_id)}>
        Assign to Consumer
      </Menu.Item> */}
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
      title: 'Contact Info',
      dataIndex: 'email',
      key: 'email',
    },
    {
      //title: `${ filter ? ( filter ==='consumerAssigned' ? 'Consumer' : 'Supplier' ) : ""} Unique ID`,
      title: `Consumer Unique ID`,
      dataIndex: 'memberId',
      key: 'memberId',
    },
    {
      title: 'Grade',
      dataIndex: 'grade',
      key: 'grade',
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
        <Dropdown overlay={menu(record)} trigger={['hover']}>
          {!filter && <Button type="primary">Assign</Button>}
        </Dropdown>
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
        width={600}
        onClose={closeDrawer}
        visible={drawerVisible}
        bodyStyle={{ paddingBottom: 80 }}
      >
        <h2 style={{margin:"0px 10px 10px 0px"}}>{currentRfqCode}</h2>
        {/* <Search
          placeholder="Search users"
          onSearch={handleUserSearch}
          style={{ marginBottom: 20 }}
          value={userSearchValue}
          onChange={(e) => handleUserSearch(e.target.value)}
        /> */}

         <Space style={{ marginBottom: 16, gap: 8 }}>
              <Search
                placeholder="Search users"
                onSearch={handleUserSearch}
                style={{ marginBottom: 20 , minWidth:100}}
                value={userSearchValue}
                onChange={(e) => handleUserSearch(e.target.value)}
              />
                <Select
                  placeholder="--Manufacturing Process--"
                  style={{ marginBottom: 20,  minWidth:100}}
                  onSelect={(value) => setUserSearchManufacturing(value)}
                  value={userSearchManufacturing}
                >
                  <option value="">Manufacturing Process</option>
                  {manufacturingProcess.map((process) => (
                    <Option key={process.id} value={process.id}>
                      {process.process_name}
                    </Option>
                  ))}
                </Select>
                <Select
                  placeholder="Country"
                  style={{ marginBottom: 20,  minWidth:100}}
                  onSelect={(value) => setUserSearchCountry(value)}
                  value={userSearchCountry}
                >
                  <option value="">Country</option>
                                  {CountryCodes.map((country, index) => (
                                    <option key={index} value={`${country.code}`}>
                                      {country.name}
                                    </option>
                                  ))}
                </Select>
                {/* <Select
                  placeholder="--Design Files--"
                  style={{ minWidth: 100 }}
                  onSelect={(value) => setFilters({ ...filters, designFiles: value })}
                  value={filters?.designFiles}
                >
                  <Option value="yes">Yes</Option>
                  <Option value="no">No</Option>
                </Select> */}
                {/* <Button
                  type="primary"
                  onClick={() => {
                    setSearchValue('');
                    setFilters({});
                  }}
                  style={{ display: 'block', margin: '0 auto' }}
                >
                  Reset
                </Button> */}
              </Space>
        <div style={{ maxHeight: 'calc(100vh - 200px)', overflowY: 'auto' }}>
        {filteredUserList.map((user) => (
          <div key={user.id} style={{ display: 'flex', padding: '10px', borderBottom: '1px solid #ccc', alignItems: 'center' }}>
            <Checkbox
              checked={selectedUsers.includes(user.id)}
              onChange={() => handleUserSelect(user.id)}
              style={{ marginRight: '10px' }}
            />
            <div style={{ display: 'flex', justifyContent: 'space-between', width: '100%', cursor: 'pointer', textDecoration: "underline"
             }}  onClick={() => { setCurrentViewedUser(user.id) ; setIsModalVisible(true)}}>
              <span style={{ flex: '1' }}>{user.name}</span>
              <span style={{ flex: '1', textAlign: 'right' }}>{user.email}</span>
             {/* <span style={{ flex: '1', textAlign: 'right' }}><Button
                 type="primary"
                onClick={handleAssignAndSave}
                style={{padding: "2px 8px"}}
              >
             <EyeOutlined />
            </Button></span> */}
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
      <SupplierPreviewModal
        isModalVisible={isModalVisible}
        setIsModalVisible={setIsModalVisible}
        userDetail={userDetail}
        fileRootPath={fileRootPath}
        manufacturingProcess={manufacturingProcess}
    />
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

export default AdminRfqList;
