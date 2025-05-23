import React from 'react';
import { API_URL } from '../utils/Config';
import { Modal, Button, Typography, Spin, Table, Image} from 'antd';

const { Paragraph, Text } = Typography;

const ViewPOModal = ({ currentRfqData, open, setOpen, viewLoading, showLoading, productList}) => {
  const products = productList?.reduce((acc, product) => {
    acc[product.id] = product?.product_name;
    return acc;
}, {});

console.log('@@products', products)

  const fileRootPath = `${API_URL}/`;
  const data = currentRfqData?.files?.map((file, index) => ({
    key: index,
    product_id: file?.product_id,
    product: products[file?.product_id] || "NA",
    qty: file?.qty,
    rate: file?.rate ?? 0,
    total_cost: file?.total_cost ?? 0
  }));

  const columns = [
    // {
    //   title: 'Product ID',
    //   dataIndex: 'product_id',
    //   key: 'product_id',
    // },
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
      title={<Text strong>PO - {currentRfqData?.po_code}</Text>} // Make title bold
      loading={viewLoading}
      open={open}
      onCancel={() => setOpen(false)}
      onOk={() => setOpen(false)}
      width={450}
    >
        <div style={{ padding: "10px 20px" }}>
          <Typography>
            <Paragraph style={{ marginBottom: 8 }}>
              <Text strong large>PO Code:</Text> {currentRfqData?.po_code}
            </Paragraph>
            <Paragraph style={{ marginBottom: 8 }}>
              <Text strong large>PO Date:</Text> {currentRfqData?.po_date}
            </Paragraph>
            <Paragraph style={{ marginBottom: 8 }}>
              <Text strong>Tax Category:</Text> {currentRfqData?.tax_category} 
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
            {currentRfqData?.tax_category && <Paragraph style={{ marginBottom: 8 }}>
              <Text strong> Tax:</Text> {currentRfqData?.tax_category}
            </Paragraph>}
            {(currentRfqData?.total_amount || currentRfqData?.total_amount_review) &&
            <Paragraph style={{ marginBottom: 8 }}>
              <Text strong>Total / Final Price:</Text> {currentRfqData?.total_amount} AED
            </Paragraph>}
          </Typography>
        </div>
    </Modal>
  );
};

export default ViewPOModal;
