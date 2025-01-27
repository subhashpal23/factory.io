import React, { useState, useEffect } from 'react';
import { Table, Input } from 'antd';
import { useDispatch, useSelector } from 'react-redux';
import { getSupplierList } from '../../redux/actions/consumerDasboradAction';

const { Search } = Input;

const HomeConsumer = () => {
  const dispatch = useDispatch();
  const { logindata, loginError } = useSelector((state) => state.auth);
  const { supplierList, error } = useSelector((state) => state.consumerDashboard); 
  const [filteredData, setFilteredData] = useState([]);
  const [searchValue, setSearchValue] = useState('');
  const [pagination, setPagination] = useState({
    current: 1,
    pageSize: 12,
    total: 0,
  });
  const [sortOrder, setSortOrder] = useState(null);
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    if (logindata && logindata.token) {
      dispatch(getSupplierList(logindata.token));
    }
  }, [dispatch, logindata]);

  useEffect(() => {
    console.log('@supplierList',supplierList)
    if (supplierList && supplierList.length > 0) {
      fetchData();
    }
  }, [supplierList, pagination.current, pagination.pageSize, sortOrder, searchValue]);

  const fetchData = () => {
    setLoading(true);
    const data = supplierList.map((d,index)=>{
      return {
        key: index,
        Id: d.id,
        Name: d.name,
        Company: d.company,
        Email: d.email,
        CountryCode: d.country_code,
        Contact: d.phone_number,
        Valid: parseInt(d.is_validated) === 1 ? 'Yes' : 'No',
        Industry: d.industry,
        CreatedDate: '2025-01-24'
      }
    });

    const filtered = searchValue
      ? data.filter(
          (item) =>
            item.Email.includes(searchValue) || item.Contact.includes(searchValue)
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

  const columns = [
    { title: 'Id', dataIndex: 'Id', key: 'Id' },
    { title: 'Name', dataIndex: 'Name', key: 'Name' },
    { title: 'Company', dataIndex: 'Company', key: 'Company' },
    { title: 'Email', dataIndex: 'Email', key: 'Email' },
    { title: 'CountryCode', dataIndex: 'CountryCode', key: 'CountryCode' },
    { title: 'Contact', dataIndex: 'Contact', key: 'Contact' },
    { title: 'Valid', dataIndex: 'Valid', key: 'Valid' },
    { title: 'Industry', dataIndex: 'Industry', key: 'Industry' },
    { title: 'CreatedDate', dataIndex: 'CreatedDate', key: 'CreatedDate' },
  ];

  return (
    <div>
      <h1 style={{marginBottom:"20px"}}> Supplier List</h1>
      <Search
        placeholder="Search by Email or Contact"
        onSearch={handleSearch}
        style={{ marginBottom: 20 }}
        value={searchValue}
        onChange={(e) => handleSearch(e.target.value)}
      />
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
