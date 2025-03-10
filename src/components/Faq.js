import React from "react";
import { Collapse, Typography } from "antd";
import { CaretDownOutlined, CaretRightOutlined } from '@ant-design/icons';
import styled from "styled-components";

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

const Container = styled.div`
  padding: 80px 5%;
  background: #0d0d0d;
  color: white;

  @media (max-width: 768px) {
    padding: 50px 12%;
    margin : 0 15%;
  }
`;

const StyledTitle = styled(Title)`
  color: white !important;
  text-align: center;
  font-size: 1.5rem !important;
`;

const StyledPanel = styled(Panel)`
  text-align: left;
  border-bottom: 1px solid #444 !important;

  .ant-collapse-header {
    color: white !important;
    font-size: 18px !important;
    font-weight: bold !important;
  }

  p {
    color: #cccccc;
    font-size: 16px;
  }
`;

const FAQ = () => {
  return (
    <Container>
      <StyledTitle level={2}>Frequently Asked Questions</StyledTitle>
      <Collapse
        accordion
        ghost
        expandIconPosition="left"
        style={{ maxWidth: "1000px", margin: "auto" }}
        expandIcon={({ isActive }) =>
          isActive ? <CaretDownOutlined style={{ color: "white" }} /> : <CaretRightOutlined style={{ color: "white" }} />
        }
      >
        {faqs.map((faq, index) => (
          <StyledPanel header={faq.question} key={index}>
            <p>{faq.answer}</p>
          </StyledPanel>
        ))}
      </Collapse>
    </Container>
  );
};

export default FAQ;
