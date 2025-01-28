import React, { useState, useEffect } from 'react';
import { Table, Input } from 'antd';
import { useDispatch, useSelector } from 'react-redux';
//import { getAdminRfqLists } from '../../redux/actions/rfqAction';
import { getAdminRfqLists } from '../../../redux/actions/rfqAction';
const { Search } = Input;

const AdminRfqList = () => {
  const dispatch = useDispatch();
  const { logindata, loginError } = useSelector((state) => state.auth);
  const { adminRfqData, error } = useSelector((state) => state.rfq); 
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
 
  const rfqList = adminRfqData && adminRfqData?.data ? adminRfqData.data : []
 
  useEffect(() => {
    if (logindata && logindata.token) {
      dispatch(getAdminRfqLists(logindata.token));
    }
  }, [dispatch, logindata]);

  useEffect(() => {
    if (rfqList && rfqList.length > 0) {
      fetchData();
    }
  }, [rfqList, pagination.current, pagination.pageSize, sortOrder, searchValue]);


 const getManufacturingProcessValue = (id) => {
  const process = manufacturingProcess.find( d => d.id === id)
  return process?.process_name || '';
 }

  const fetchData = () => {
    setLoading(true);
    const data = rfqList.map((d, index) => {
      return {
        key: index,
        name: d.name,
        email: d.email,
        contact: d.mobile,
        //manufacturingProcess: d.manufacturing_process_id,
        manufacturingProcess: getManufacturingProcessValue(d.manufacturing_process_id),
        designFiles: d.is_design_file === "1" ? 'Yes' : 'No',
        comments: d.comments,
      };
    });

    const filtered = searchValue
      ? data.filter(
          (item) =>
            item.email.includes(searchValue) || item.contact.includes(searchValue)
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

export default AdminRfqList;
