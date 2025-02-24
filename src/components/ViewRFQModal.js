import React from 'react';
import { Modal, Button, Typography, Spin, Table, Image} from 'antd';

const { Paragraph, Text } = Typography;

const ViewRFQModal = ({ currentRfqData, open, setOpen, viewLoading, showLoading, productList }) => {
  const products = productList?.reduce((acc, product) => {
    acc[product.id] = product?.product_name;
    return acc;
}, {});

  const fileRootPath = 'https://factory.demosite.name/api/';
  const data = currentRfqData?.files?.map((file, index) => ({
    key: index,
    product: products[file?.product_id],
    qty: file?.qty,
    designFiles: file?.files ? JSON.parse(file.files)?.map((file, index) => (
      <a key={index} href={`${fileRootPath}${file.replace(/\\\//g, '/')}`} target="_blank" rel="noreferrer">
        <Image
          width={100}
          src={`${fileRootPath}${file.replace(/\\\//g, '/')}`}
        />
      </a>
    )) : "NA" 
  }));

  const columns = [
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
      title: 'Design Files',
      dataIndex: 'designFiles',
      key: 'designFiles',
    },
  ];

  return (
    <Modal
      title={<Text strong>{currentRfqData?.rfqcode}</Text>} // Make title bold
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
              <Text strong>Manufacturing Process:</Text> {currentRfqData?.manufacturingProcess}
            </Paragraph>
            <Paragraph style={{ marginBottom: 8 }}>
              <Text strong>Design Files:</Text> {currentRfqData.designFiles}
            </Paragraph>
            <Paragraph style={{ marginBottom: 8 }}>
              <Text strong>Comments:</Text> {currentRfqData?.comments}
            </Paragraph>
            <Paragraph style={{ marginBottom: 8 }}>
            <Text strong large>Design Files:</Text>
              {currentRfqData?.files?.length > 0 ? ( <Table dataSource={data} columns={columns} />) : "  NA"}
            </Paragraph>
          </Typography>
        </div>
    </Modal>
  );
};

export default ViewRFQModal;
