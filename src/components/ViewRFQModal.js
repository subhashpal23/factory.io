import React from 'react';
import { Modal, Button, Typography, Spin } from 'antd';

const { Paragraph, Text } = Typography;

const ViewRFQModal = ({ currentRfqData, open, setOpen, viewLoading, showLoading }) => {
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
              <Text strong>Design Files:</Text> {currentRfqData.is_design_file === "1" ? "Yes" : "No"}
            </Paragraph>
            <Paragraph style={{ marginBottom: 8 }}>
              <Text strong>Comments:</Text> {currentRfqData?.comments}
            </Paragraph>
          </Typography>
        </div>
    </Modal>
  );
};

export default ViewRFQModal;
