import React, { useState, useEffect, Fragment } from 'react';
import { Table, Input, Button, Checkbox, Drawer, Dropdown, Menu, Modal, DatePicker, Select, Upload, Form, Space, message } from 'antd'
import { useDispatch, useSelector } from 'react-redux';
import { getConsumerQuoteList, acceptRejectQuoteByCustomer } from '../../redux/actions/supplierRfqAction';
import { createPO, getProductList, getTaxCategoryList } from '../../redux/actions/rfqAction';
import {
  EyeOutlined, 
  UploadOutlined
} from '@ant-design/icons';
import ViewQuoteModal from "../ViewQuoteModal";
//import { getAdminRfqLists } from '../../../redux/actions/rfqAction';
//import { getAllSupplier, getAllConsumer } from '../../../redux/actions/allDataAction';
//import { assignRfqToSupplier, resetAssignRfqStatus } from '../../../redux/actions/assignRfqAction';
const { Search } = Input;
const { confirm } = Modal;
const { Option } = Select;
const { TextArea } = Input;


const ConsumerQuotesList = ({ filter }) => {
   const [form] = Form.useForm();
  const dispatch = useDispatch();
  const [rfqList, setRfqList] = useState([])
  const { logindata } = useSelector((state) => state.auth);
  const { quoteConsumerData } = useSelector((state) => state.supplierRfq);
   const { productList, taxCategoryData} = useSelector((state) => state.rfq);
  const allSupplier = useSelector((state) => state.dataSet.allSupplier);
  const allConsumer = useSelector((state) => state.dataSet.allConsumer);
  const manufacturingProcess = useSelector((state) => state.auth.logindata.manufacturing_process);
  const rfqAssignStatus = useSelector((state)=> state.assignRfq.assignStatus)
  const poCreateStatus = useSelector((state) => state.rfq.poCreateStatus);
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
  const [currentRfq, setCurrentRfq] = useState(null);
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
  const showLoading = () => {
    setOpen(true);
    setViewLoading(true);

    setTimeout(() => {
      setViewLoading(false);
    }, 300);
  };

  useEffect(()=>{
    if(quoteConsumerData)
      setRfqList(quoteConsumerData.data || [])
  },[quoteConsumerData])

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
        dispatch(getConsumerQuoteList(logindata.token));
        dispatch(getProductList(logindata.token));
        dispatch(getTaxCategoryList(logindata.token));
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

    useEffect(() => {
        if (poCreateStatus) {
          form.resetFields(); 
          handleReset();
          setDrawerVisible(false);
        }
      }, [poCreateStatus]);
  

  //console.log('@@formData', formData);
  const fetchData = () => {
    setLoading(true);
    const data = rfqList.map((d, index) => ({
      rfq_id: d.id, // Quote ID, mistake
      rfqcode: d.rfq_code,
      rfqId: d.rfq_id, // rfq Id
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
      status: d.customer_status,
      accept_date: d.customer_accept_date,
      supplier_grade: d.supplier_grade,
      supplier_uuid: d.supplier_uuid,
      total_tax: d.total_tax,
      total_amount: d.total_amount,
      tax_category: taxCategoryData?.data?.filter((tax)=>tax.id === d.tax_category)[0]?.tax_name,
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

  const showDrawer = (title, dataset, rfqCode, rfqId, rfq ) => {
    if(dataset==='supplier'){ 
      setDrawerTitle(title);
      setDrawerVisible(true);
      setDrawerActiveDataSet(dataset);
      setCurrentRfqCode(rfqCode);
      setCurrentRfqId(rfqId)
      setCurrentRfq(rfq);
      setFormData({
        ...formData,
        ...rfq,
        ...rfq?.files?.reduce((acc, item) => ({
          ...acc,
          [`qty_${item.product_id}`]: item.quantity ?? "",
          [`rate_${item.product_id}`]: item.rate ?? "",
          [`amount_${item.product_id}`]: item.rate ?? "",
        }), {})
      });
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
        dispatch(acceptRejectQuoteByCustomer(logindata.token, request));
        setTimeout(()=>{
          dispatch(getConsumerQuoteList(logindata.token));
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
            dispatch(acceptRejectQuoteByCustomer(logindata.token, request));
            setTimeout(()=>{
              dispatch(getConsumerQuoteList(logindata.token));
            },1500)
          }
        },
      });
    };

  const handleFormChange = (key, value, file) => {
    setFormData(prev => {
      const updatedFormData = {
        ...prev,
        [key]: value,
      };
  
      const quantity = updatedFormData[`qty_${file?.product_id}`] || 0;
      const rate = updatedFormData[`rate_${file?.product_id}`] || 0;
      const amount = quantity * rate;
  
      return {
        ...updatedFormData,
        [`amount_${file?.product_id}`]: amount,
      };
    });
  };

  const handleReset = () => {
    setFormData({
      total_cost: '',
      valid_till: null,
      duration: '',
      documents: [],
      payment_term: '',
      terms_conditions: '',
      parts: [],
        ...currentRfq,
        ...currentRfq?.files?.reduce((acc, item) => ({
          ...acc,
          [`qty_${item.product_id}`]: item.qty ?? "",
        }), {})
    });
  };

  const transformFormData = (formData, productList) => {
    const files = Object.keys(formData)
      .filter(key => key.startsWith('qty_') || key.startsWith('rate_') || key.startsWith('amount_'))
      .reduce((acc, key) => {
        const [, productId] = key.split('_');
        if (!productId || productId === 'undefined') return acc;
  
        let item = acc.find(i => i.product_id === productId);
  
        if (!item) {
          const product = productList.find(p => p.id === productId);
          item = {
            product: product ? product.product_name : `Unknown Product (${productId})`,
            product_id: productId,
            quantity: "",
            rate: "",
            total_cost: ""
          };
          acc.push(item);
        }
  
        if (key.startsWith('qty_')) item.quantity = formData[key];
        if (key.startsWith('rate_')) item.rate = formData[key];
        if (key.startsWith('amount_')) item.total_cost = formData[key];
  
        return acc;
      }, []);
  
    const uniqueFiles = files.filter((file, index, self) => 
      index === self.findIndex(f => f.product_id === file.product_id)
    );
  
    const transformedData = {
      ...formData,
      files: uniqueFiles
    };
  
    Object.keys(formData).forEach(key => {
      if (key.startsWith('qty_') || key.startsWith('cost_') || key.startsWith('rate_') || key.startsWith('amount_')) {
        delete transformedData[key];
      }
    });
  
    return transformedData;
  };

  const handleSubmit = () => {
    //console.log('@@formdata',formData)
      const tranformData = transformFormData(formData, productList)
      const dataToSend = {
        documents : formData?.document,
        files: tranformData?.files,
        payment_term: tranformData?.payment_term,
        term_and_cond: tranformData?.term_and_cond,
        timeline_unit: tranformData?.timeline_unit,
        timeline_val: tranformData?.timeline_val,
        quote_id: tranformData?.rfq_id,
        rfq_id: tranformData?.rfqId,
        rfq_code: tranformData?.rfqcode,
        valid_till:  tranformData?.valid_till,
        tax_category: tranformData?.tax_category,
      };
  
      //console.log('@@dataToSend',dataToSend)
      dispatch(createPO(dataToSend, logindata?.token));
    };
  


  const filteredUserList = userSearchValue
    ? userList.filter((user) =>
      user.name.toLowerCase().includes(userSearchValue.toLowerCase()) ||
      user.email.toLowerCase().includes(userSearchValue.toLowerCase())
    )
    : userList;

  const menu = (record) => (
    <Menu>
      <Menu.Item key="supplier" onClick={() => showDrawer('Assign to Supplier', 'supplier', record.rfqcode, record.rfq_id, record)}>
        Assign to Supplier
      </Menu.Item>
      <Menu.Item key="consumer" onClick={() => showDrawer('Assign to Consumer', 'consumer', record.rfqcode, record.rfq_id, record)}>
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
      title: 'Supplier UID',
      dataIndex: 'supplier_uuid',
      key: 'supplier_uuid',
    },
    {
      title: 'Grade',
      dataIndex: 'supplier_grade',
      key: 'supplier_grade',
    },
    {
      title: 'Timeline',
      dataIndex: 'timeline',
      key: 'timeline',
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
    },
    {
      title: 'Terms and Conditions',
      dataIndex: 'term_and_cond',
      key: 'term_and_cond',
    },
    {
          title: 'Action',
          key: 'action',
          render: (_, record) => (
            <div>
              {!filter && (
                <>
                { record?.status === null && <Fragment>
                  <Button
                    type="primary"
                    onClick={() => {
                      //setCurrentRfqId(record.rfq_id);
                      handleAccept(record.rfq_id);
                    }}
                    // style={{ marginRight: '8px' }}
                    style={{ backgroundColor: '#2E6F40', borderColor: 'white',marginRight: '8px' }}
                  >
                    Accept
                  </Button>
                  <Button
                    type="danger"
                    style={{ backgroundColor: '#E32227', borderColor: 'white', color:'white', marginRight: '8px' }}
                    onClick={() => {
                      handleReject(record.rfq_id);
                    }}
                  >
                    Reject
                  </Button>
                  </Fragment>}
                  {record?.status !== null && <Fragment><span  style={{ color:`${record?.status === '1' ? `green` : `red`}`}}>{record?.status === '1' ? `Accepted` : `Rejected`} on {record?.accept_date}</span><br/></Fragment>}
                  {record?.status === '1' && <Button type="primary" onClick={() => showDrawer('Generate PO', 'supplier', record.rfqcode, record.rfq_id , record)} > Generate PO</Button>}
                  <Button
                    type="primary"
                    style={{ borderColor: 'white', color:'white', marginLeft: '4px' }}
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


   const props = (fieldKey) => ({
      name: 'file',
      customRequest: ({ file, onSuccess }) => {
        handleFileUpload(file, fieldKey);
        onSuccess("ok");
      }
    });
  
    const handleFileUpload = async (file, fieldKey) => {
      const formData = new FormData();
      formData.append('upload[0]', file);
    
      try {
        const response = await fetch('https://factory.demosite.name/api/Api/multipleDocUpload', {
          method: 'POST',
          headers: {
            'Authorization': `Bearer ${logindata?.token}`,
          },
          body: formData
        });
    
        const result = await response.json();
        if (response.ok) {
          message.success(`${file.name} file uploaded successfully`);
          setFormData(prevState => {
            return { ...prevState, document: result[0]};
          });
        } else {
          message.error(`${file.name} file upload failed.`);
        }
      } catch (error) {
        message.error(`${file.name} file upload failed.`);
      }
    };
  
  
     const onFinish = (values) => {
          console.log("values", values, formData);
        };

        
  return (
    <div>
      <h1 style={{ marginBottom: '20px' }}>Quote List</h1>
      <ViewQuoteModal currentRfqData={currentRfqData} open={open} setOpen={setOpen} viewLoading={viewLoading} setViewLoading={setViewLoading} productList={productList}/>
      <Space style={{ marginBottom: 16, gap: 16 }}>
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
        <h2 style={{ margin: '0px 10px 10px 0px' }}>{`RFQ Code  :  ${currentRfqCode}`}</h2>
        <div style={{ textAlign: 'right', marginBottom: '10px' }}>
          <Button type="link" onClick={handleReset}>
            Reset Fields
          </Button>
        </div>
      <Form layout="vertical" onFinish={onFinish} form={form} >
        {formData?.files?.length > 0 && (
        <Form.List name="files">
            {() => (
              <>
                {formData?.files?.map((file, index) => (
                 <Space style={{ marginBottom: 2, gap: 8 }}>
                    <Form.Item 
                    label="Product"
                    name={`product_${file?.product_id}`}
                    //rules={[{ required: true, message: 'Missing Product' }]}
                    >
                      <Select placeholder="--Please choose an option--" defaultValue={file?.product_id} disabled>
                      {productList?.map((product) => (
                        <Option key={product.id} value={product.id} >{product.product_name}</Option>
                      ))}
                      </Select>
                    </Form.Item>
                    <Form.Item
                         label="Quantity"
                        name={`qty_${file?.product_id}`}
                        //rules={[{ required: true, message: 'Missing Quantity' }]}
                      >
                      <Input placeholder="Quantity" defaultValue={formData[`qty_${file.product_id}`]} onChange={(e) => handleFormChange(`qty_${file?.product_id}`, e.target.value, file)}/>
                    </Form.Item>
                    {/* <Form.Item
                        label="Cost"
                        name={`cost_${file?.product_id}`}
                        rules={[{ required: true, message: 'Missing Cost' }]}
                      >
                      <Input placeholder="Target Cost" onChange={(e) => handleFormChange(`cost_${file?.product_id}`, e.target.value)}/>
                    </Form.Item> */}
                    <Form.Item
                       label="Rate"
                        name={`rate_${file?.product_id}`}
                        rules={[{ required: true, message: 'Missing Rate' }]}
                      >
                     <Input placeholder="Rate" defaultValue={formData?.[`rate_${file.product_id}`]}  onChange={(e) => {
                        handleFormChange(`rate_${file?.product_id}`, e.target.value, file);
                      }}/>
                    </Form.Item>
                    <Form.Item
                      label="Amount"
                      name={`amount_${file?.product_id}`}
                      //rules={[{ required: true, message: 'Missing Quantity' }]}
                      style={{ display: 'flex', justifyContent: 'center', alignItems: 'center' }}
                  >
                    <span   style={{ display: 'flex', justifyContent: 'center', alignItems: 'center' }}>{formData?.[`amount_${file?.product_id}`] ?? 0}</span>
                  </Form.Item>
                  </Space>
                  ))} 
                  </>
                )}
        </Form.List>)}
        <Form.Item
            label="Tax Category"
            required
          >
            <Input
            value={formData.tax_category}
            type="text"
            onChange={(e) => handleFormChange('tax_category', e.target.value)}
            style={{ width: '200px' }}
          />
         </Form.Item>
      <div style={{ display: 'flex', alignItems: 'center', gap: '16px' }}>
        <Form.Item label="Timeline" required>
          <Input
            value={formData.timeline_val}
            type="number"
            onChange={(e) => handleFormChange('timeline_val', e.target.value)}
            style={{ width: '200px' }}
          />
        </Form.Item>
          <Form.Item
            label="Unit"
            required
          >
            <Select
              value={formData.timeline_unit}
              onChange={(value) => handleFormChange('timeline_unit', value)}
              options={[
                { value: 'Days', label: 'Days' },
                { value: 'Weeks', label: 'Weeks' },
                { value: 'Months', label: 'Months' },
              ]}
              style={{ width: '200px' }}
              defaultValue={formData?.timeline?.split('')?.[1]}
            />
         </Form.Item>
        </div>
          <Form.Item label="Quote valid till" required>
            <DatePicker
              style={{ width: '100%' }}
              value={formData.valid_till}
              defaultValue={formData.validTill}
              onChange={(date) => handleFormChange('valid_till', date)}
            />
          </Form.Item>
          <Form.Item
            label="Payment terms"
            name="payment_term"
            rules={[{ required: true, message: 'Type payment terms here', }]}
           >
            <TextArea rows={4} placeholder="Type payment terms  here"  maxLength={1024} showCount 
            onChange={(e) => handleFormChange('payment_term', e.target.value)} />
          </Form.Item>

          <Form.Item
            label="Terms & Conditions"
            name="term_and_cond"
            rules={[{ required: true, message: 'Type terms & conditions here', }]}
           >
            <TextArea rows={4} placeholder="Type terms & conditions here"  maxLength={1024} showCount
            onChange={(e) => handleFormChange('term_and_cond', e.target.value)}/>
          </Form.Item>
    
          <Form.Item
          name="addcomument"
          label="Documents"
          //rules={[{ required: true, message: "Please upload a document" }]}
          valuePropName="file"
        >
           <Upload {...props('addcomument')} multiple={true} showUploadList={true} >
              <Button icon={<UploadOutlined />}>Upload Document</Button>
            </Upload>
            {/* {formData?.files} */}
        </Form.Item>
          <Form.Item>
            <Button
              type="primary" htmlType="submit" 
              onClick={handleSubmit}
              style={{ display: 'block', margin: '0 auto' }}
            >
              Generate PO
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

export default ConsumerQuotesList;
