import React from 'react';
import { Modal, Button, Typography, Spin, Table, Image} from 'antd';

const { Paragraph, Text } = Typography;

const ViewQuoteModal = ({ currentRfqData, open, setOpen, viewLoading, showLoading, productList }) => {
  console.log('@@currentRfqData', currentRfqData, productList)
  const products = productList?.reduce((acc, product) => {
    acc[product.id] = product?.product_name;
    return acc;
}, {});

console.log('@@products', products)

  const fileRootPath = 'https://factory.demosite.name/api/';
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
            <Paragraph style={{ marginBottom: 8 }}>
            <Text strong large>Products:</Text>
              {currentRfqData?.files?.length > 0 ? ( <Table dataSource={data} columns={columns} pagination={false}/>) : "  NA"}
            </Paragraph>
          </Typography>
        </div>
    </Modal>
  );
};

export default ViewQuoteModal;
