import React from "react";
import { Collapse, Typography } from "antd";
import { CaretDownOutlined, CaretRightOutlined } from '@ant-design/icons';  // Import the icons

const { Panel } = Collapse;
const { Title } = Typography;

const faqs = [
  {
    question: "Is DigiFactory Worth It?",
    answer: "Yes, DigiFactory helps you find reliable manufacturers, get multiple quotes, and manage your order efficiently.",
  },
  {
    question: "Is DigiFactory Easy to Use?",
    answer: "Absolutely! The platform is designed for ease of use, allowing you to upload your designs and connect with manufacturers seamlessly.",
  },
  {
    question: "What is the Benefit of Using DigiFactory? Why Should I Find Manufacturers on This Platform?",
    answer:
      "Using DigiFactory to find manufacturers is a smart way to get multiple quotes from reliable manufacturers worldwide. With support from dedicated account managers, you can easily find the right fit for your project, whether it's CNC machining, 3D printing, injection molding, or fabrication. Plus, DigiFactory has a secure payment platform, and there are no fees for using the service.",
  },
  {
    question: "When Should I Use Custom Manufacturing?",
    answer: "Custom manufacturing is ideal when you need precise, unique, or small-batch production that off-the-shelf products cannot provide.",
  },
];

const FAQ = () => {
  return (
    <div style={{ padding: "80px 50px", background: "#0D0D0D", color: "white" }}>
      <Title level={2} style={{ color: "white", textAlign: "center" }}>Frequently Asked Questions</Title>
      <Collapse 
        accordion 
        ghost 
        expandIconPosition="left" // Move the icons to the left
        style={{ maxWidth: "1000px", margin: "auto" }}
        expandIcon={({ isActive }) => isActive ? <CaretDownOutlined style={{ color: "white" }} /> : <CaretRightOutlined style={{ color: "white" }} />}
      >
        {faqs.map((faq, index) => (
          <Panel 
            header={<span style={{ color: "white", fontSize: "18px", fontWeight: "bold" }}>{faq.question}</span>} 
            key={index}
            style={{ textAlign: "left", borderBottom: "1px solid #444"}}
          >
            <p style={{ color: "#CCCCCC", fontSize: "16px" }}>{faq.answer}</p>
          </Panel>
        ))}
      </Collapse>
    </div>
  );
};

export default FAQ;
