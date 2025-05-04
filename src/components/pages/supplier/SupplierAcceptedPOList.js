import React, { useState, useEffect, Fragment } from 'react';
import { Table, Input, Button, Select, Space, Modal } from 'antd';
import { useDispatch, useSelector } from 'react-redux';
import { getAcceptedSupplierPOList, getProductList, getTaxCategoryList } from '../../../redux/actions/rfqAction';
import { acceptRejectPObySupplier } from '../../../redux/actions/supplierRfqAction';
import ViewPOModal from "../../ViewPOModal";
import {
  EyeOutlined
} from '@ant-design/icons';

const { Search } = Input;
const { Option } = Select;
const { confirm } = Modal;

const SupplierAcceptedPOList = () => {
  const dispatch = useDispatch();
  const { logindata, loginError } = useSelector((state) => state.auth);
  const { supplierAcceptedPoData, error , taxCategoryData} = useSelector((state) => state.rfq); 
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
  const { productList } = useSelector((state) => state.rfq);
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
  
  const rfqList = supplierAcceptedPoData && supplierAcceptedPoData?.data ? supplierAcceptedPoData.data : []
 
  useEffect(() => {
    if (logindata && logindata.token) {
      dispatch(getAcceptedSupplierPOList(logindata.token));
      dispatch(getProductList(logindata.token));
      dispatch(getTaxCategoryList(logindata.token));
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
    po_id: d.id,
    rfq_id: d.rfq_id,
    quote_id: d.quote_id,
    po_code: d.po_code,
    tax_category: taxCategoryData?.data?.filter((tax)=>tax.id === d.tax_category)[0]?.tax_name,
    payment_term: d.payment_term,
    term_and_condition: d.term_and_condition,
    po_date: d.po_date,
    status: d.supplier_status,
    accept_date: d.supplier_accept_date,
    accept_by: d.supplier_accept_by,
    files: d.files,
    total_tax: d.total_tax,
    total_amount: d.total_amount,
    files_review: d.files_review,
    total_amount_review: d.total_amount_review,
    tax_category: taxCategoryData?.data?.filter((tax)=>tax.id === d.tax_category)[0]?.tax_name,
    member_id: d.member_id,
    quote_code: d.quote_code
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


const handleAccept = (rfqId) => {
    if (rfqId) {
      const request = { po_id: rfqId, status: 1 }
      dispatch(acceptRejectPObySupplier(logindata.token, request));
      setTimeout(()=>{
        dispatch(getAcceptedSupplierPOList(logindata.token));
      },1500)
      
    }
  };

  const handleReject = (rfqId) => {
    confirm({
      title: 'Are you sure to Reject PO?',
      onOk() {
        if (rfqId) {
          //const selectedRfq = rfqList.find(rf => rf.id === rfqId)
          const request = { po_id: rfqId, status: 0 }
          dispatch(acceptRejectPObySupplier(logindata.token, request));
          setTimeout(()=>{
            dispatch(getAcceptedSupplierPOList(logindata.token));
          },1500)
        }
      },
    });
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
      title: 'PO Code',
      dataIndex: 'po_code',
      key: 'po_code',
    },
    {
      title: 'Quote no',
      dataIndex: 'quote_code',
      key: 'quote_code',
    },
    {
      title: 'Tax Category',
      dataIndex: 'tax_category',
      key: 'tax_category',
    },
    {
      title: 'Consumer UID ',
      dataIndex: 'member_id',
      key: 'member_id',
    },
    {
      title: 'Payment Terrms',
      dataIndex: 'payment_term',
      key: 'payment_term',
    },
    {
      title: 'Term and Conditions',
      dataIndex: 'term_and_condition',
      key: 'term_and_condition',
    },
    {
      title: 'PO Date',
      dataIndex: 'po_date',
      key: 'po_date',
    },
    {
        title: 'Action',
        key: 'action',
       render: (_, record) => (
                      <div>
                          <> {record?.status === null ?
                             <Fragment>
                            <Button
                              type="primary"
                              onClick={() => {
                                //setCurrentRfqId(record.rfq_id);
                                handleAccept(record.po_id);
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
                                handleReject(record.po_id);
                              }}
                            >
                              Reject
                            </Button></Fragment> : <Fragment><span  style={{ color:`${record?.status === '1' ? `green` : `red`}`}}>{record?.status === '1' ? `Accepted` : `Rejected`} on {record?.accept_date}</span></Fragment> }
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
                      </div>
                    ),
        }
  ];

  return (
    <div>
      <h1 style={{marginBottom:"20px"}}> PO List</h1>
      <ViewPOModal currentRfqData={currentRfqData} open={open} setOpen={setOpen} viewLoading={viewLoading} setViewLoading={setViewLoading} productList={productList}/>
       {/* <Space style={{ marginBottom: 16, gap: 16 }}>
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
      </Space> */}
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

export default SupplierAcceptedPOList;