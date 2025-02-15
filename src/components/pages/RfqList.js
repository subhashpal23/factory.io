import React, { useState, useEffect } from 'react';
import { Table, Input, Button, Select, Space } from 'antd';
import { useDispatch, useSelector } from 'react-redux';
import { getRfqList } from '../../redux/actions/rfqAction';

const { Search } = Input;
const { Option } = Select;

const HomeConsumer = () => {
  const dispatch = useDispatch();
  const { logindata, loginError } = useSelector((state) => state.auth);
  const { rfqData, error } = useSelector((state) => state.rfq); 
  const manufacturingProcess = useSelector((state) => state.auth.logindata.manufacturing_process);
  const [filteredData, setFilteredData] = useState([]);
  const [searchValue, setSearchValue] = useState('');
  const [pagination, setPagination] = useState({
    current: 1,
    pageSize: 12,
    total: 0,
  });
  const [sortOrder, setSortOrder] = useState(null);
  const [loading, setLoading] = useState(false);
  const [ filters, setFilters] = useState({})
 
  const rfqList = rfqData && rfqData?.data ? rfqData.data : []
 
  useEffect(() => {
    if (logindata && logindata.token) {
      dispatch(getRfqList(logindata.token));
    }
  }, [dispatch, logindata]);

  useEffect(() => {
    if (rfqList && rfqList.length > 0) {
      fetchData();
    }
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [rfqList, pagination.current, pagination.pageSize, sortOrder, searchValue, filters]);


 const getManufacturingProcessValue = (id) => {
  const process = manufacturingProcess.find( d => d.id === id)
  return process?.process_name || '';
 }

 const fetchData = () => {
  setLoading(true);
  const data = rfqList.map((d, index) => ({
    key: index,
    rfqcode: d.rfq_code,
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

  const columns = [
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
  ];

  return (
    <div>
      <h1 style={{marginBottom:"20px"}}> Rfq List</h1>
      {/* <Search
        placeholder="Search by Email or Contact"
        onSearch={handleSearch}
        style={{ marginBottom: 20 }}
        value={searchValue}
        onChange={(e) => handleSearch(e.target.value)}
      /> */}
       <Space style={{ marginBottom: 16, gap: 16 }}>
        <Search
          placeholder="Search by Email / Name / Contact"
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

export default HomeConsumer;
