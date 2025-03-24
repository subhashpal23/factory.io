import React from 'react';
import { Modal, Button, Typography, Spin, Table, Image, Input} from 'antd';
import {
  SaveOutlined,
} from '@ant-design/icons';
import { updateQuoteCommissionAdmin } from '../redux/actions/supplierRfqAction';
import { useDispatch , useSelector} from 'react-redux';

const { Paragraph, Text } = Typography;

const ViewQuoteModal = ({ currentRfqData, open, setOpen, viewLoading, showLoading, productList, isEdit }) => {
  const products = productList?.reduce((acc, product) => {
    acc[product.id] = product?.product_name;
    return acc;
}, {});

  const dispatch = useDispatch();
  const { logindata } = useSelector((state) => state.auth);
  const [commission, setCommission] = React.useState(currentRfqData?.commission_per);

 const handleUpdateCommission = () => {
      const request = { quote_id: currentRfqData?.rfq_id, commission_per: commission }
      //console.log("@@@request", request,logindata );
      dispatch(updateQuoteCommissionAdmin(logindata.token, request));
      setTimeout(()=>{
        setOpen(false);
      },1500)
  };


  const fileRootPath = 'https://factory.demosite.name/api';
  const data = currentRfqData?.files?.map((file, index) => ({
    key: index,
    product_id: file?.product_id,
    product: products[file?.product_id] || "NA",
    qty: file?.quantity,
    rate: file?.rate ?? 0,
    total_cost: file?.total_cost ?? 0
  }));

  const columns = [
    {
      title: 'Product ID',
      dataIndex: 'product_id',
      key: 'product_id',
    },
    {
      title: 'Product',
      dataIndex: 'product',
      key: 'product',
    },
    {
      title: 'Quantity',
      dataIndex: 'qty',
      key: 'qty',
    },
    {
      title: 'Rate',
      dataIndex: 'rate',
      key: 'rate',
    },
    {
      title: 'Total Cost',
      dataIndex: 'total_cost',
      key: 'total_cost',
    }
  ];

  return (
    <Modal
      title={<Text strong>Quote For RFQ - {currentRfqData?.rfqcode}</Text>} // Make title bold
      loading={viewLoading}
      open={open}
      onCancel={() => setOpen(false)}
      onOk={() => setOpen(false)}
      width={450}
    >
        <div style={{ padding: "10px 20px" }}>
          <Typography>
            <Paragraph style={{ marginBottom: 8 }}>
              <Text strong large>RFQ Code:</Text> {currentRfqData?.rfqcode}
            </Paragraph>
            <Paragraph style={{ marginBottom: 8 }}>
              <Text strong>Timeline:</Text> {currentRfqData?.timeline}
            </Paragraph>
            <Paragraph style={{ marginBottom: 8 }}>
              <Text strong>Valid Till:</Text> {currentRfqData.validTill}
            </Paragraph>
            <Paragraph style={{ marginBottom: 8 }}>
              <Text strong>Payment Terms:</Text> {currentRfqData?.payment_term}
            </Paragraph>
            <Paragraph style={{ marginBottom: 8 }}>
              <Text strong>Terms & Conditions:</Text> {currentRfqData?.term_and_cond}
            </Paragraph>
            {isEdit && (
            <Paragraph style={{ marginBottom: 8, marginTop: 12 }}>
            <Text strong>Plaform Fee/ Commission ( Percentage % ):</Text>
              <Input
                label="Plaform Fee/ Commission"
                value={commission ?? currentRfqData?.commission_per}
                onChange={(e) => setCommission(e.target.value)}
                type="text"
                style={{ width: '120px', marginTop: 10 }}
              />
               <Button
                    type="primary"
                    style={{ borderColor: 'white', color:'white', marginLeft: 10, marginTop: 10 }}
                    onClick={handleUpdateCommission}
                  >
                Update Commission <SaveOutlined/>
             </Button>
            </Paragraph>)}
            {!isEdit && (
            <Paragraph style={{ marginBottom: 8, marginTop: 12 }}>
            <Text strong>Plaform Fee/ Commission ( Percentage % ): {commission ?? currentRfqData?.commission_per}</Text>
            </Paragraph>)}

            {currentRfqData?.total_tax && <Paragraph style={{ marginBottom: 8 }}>
              <Text strong>Total Tax:</Text> {currentRfqData?.total_tax} AED
            </Paragraph>}
            {currentRfqData?.total_amount &&
            <Paragraph style={{ marginBottom: 8 }}>
              <Text strong>Total / Final Price:</Text> {currentRfqData?.total_amount} AED
            </Paragraph>}
            
            {!isEdit && (
            <Paragraph style={{ marginBottom: 8 }}>
            <Text strong large>Products:</Text>
              {currentRfqData?.files?.length > 0 ? ( <Table dataSource={data} columns={columns} pagination={false}/>) : "  NA"}
            </Paragraph>
            )}
             <Paragraph style={{ marginBottom: 8 }}>
              <Text strong>Uploaded File: </Text>
              {currentRfqData?.addcomument ? (
                <div>
                  <a
                    href={`${fileRootPath}${currentRfqData.addcomument.replace(/\\|\//g, "/")}`}
                    target="_blank"
                    rel="noreferrer"
                  >
                    {/\.(jpg|jpeg|png|gif|bmp|svg|webp)$/i.test(currentRfqData.addcomument) ? (
                      <Image
                        width={100}
                        src={`${fileRootPath}${currentRfqData.addcomument.replace(/\\|\//g, "/")}`}
                        alt="Document"
                      />
                    ) : (
                      <span>{currentRfqData.addcomument.split("/").pop()}</span>
                    )}
                  </a>

                  {/* Download button for non-image files */}
                  {!/\.(jpg|jpeg|png|gif|bmp|svg|webp)$/i.test(currentRfqData.addcomument) && (
                    <a
                      href={`${fileRootPath}${currentRfqData.addcomument.replace(/\\|\//g, "/")}`}
                      download={currentRfqData.addcomument.split("/").pop()} // Ensures correct file download
                      style={{
                        marginLeft: "10px",
                        padding: "5px 10px",
                        background: "#007bff",
                        color: "#fff",
                        borderRadius: "5px",
                        textDecoration: "none",
                        display: "inline-block",
                      }}
                    >
                      Download
                    </a>
                  )}
              </div>
            ) : (
            "  NA"
            )}
            </Paragraph>
          </Typography>
        </div>
    </Modal>
  );
};

export default ViewQuoteModal;
