import React from "react";
import { Button, Typography, Card} from "antd";
import { ClockCircleOutlined, SyncOutlined, DollarOutlined } from "@ant-design/icons";
import styled from "styled-components";
import { useNavigate } from 'react-router-dom';

const { Title, Text } = Typography;

const ManufacturerStyledSearch = styled.div`
 @media (max-width: 768px) {
   .text-section {
    width: 60% !important;
    display: flex !important;
    gridTemplateColumns: auto !important;
   }

   .image-section {
       display: none;
   }

   .heading {
    padding : 0 10%;
    margin: 0 !important;
   }
  }
`

const ManufacturerSearch = () => {
  const navigate = useNavigate();

  return (
    <ManufacturerStyledSearch>
    <div
      style={{
        minHeight: '100vh',
        display: 'flex',
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#f5f5f5',
        padding: '20px',
      }}
    >
      <div
        style={{
          maxWidth: '1200px',
          width: '100%',
          display: 'grid',
          gridTemplateColumns: '1fr 1fr',
          gap: '40px',
          backgroundColor: 'white',
          padding: '30px',
          borderRadius: '12px',
          boxShadow: '0px 4px 10px rgba(0, 0, 0, 0.1)',
        }}
        className="text-section"
      >
        <div style={{ margin: '48px 24px' }}>
          <Title level={2} className="heading">Your Manufacturer Search, Simplified</Title>
          <div style={{ margin: '48px 24px' }}>
            <div style={{ display: 'flex', alignItems: 'center', margin: '30px 16px' }}>
              <ClockCircleOutlined
                style={{ fontSize: '20px', color: '#1890ff', marginRight: '10px' }}
              />
              <div>
                <Text strong>Work Faster</Text>
                <p>Submit just one Request for Quote to get estimates from manufacturers worldwide.</p>
              </div>
            </div>

            <div style={{ display: 'flex', alignItems: 'center', margin: '30px 16px' }}>
              <SyncOutlined
                style={{ fontSize: '20px', color: '#1890ff', marginRight: '10px' }}
              />
              <div>
                <Text strong>Streamline Your Process</Text>
                <p>Find, communicate, track orders, and pay within MFG.</p>
              </div>
            </div>

            <div style={{ display: 'flex', alignItems: 'center', margin: '30px 16px' }}>
              <DollarOutlined
                style={{ fontSize: '20px', color: '#1890ff', marginRight: '10px' }}
              />
              <div>
                <Text strong>Save Money</Text>
                <p>MFG’s services are free for buyers, ensuring the best price from manufacturers.</p>
              </div>
            </div>
          </div>

          {/* Center the button */}
          <div style={{ display: 'flex', justifyContent: 'center', marginTop: '20px' }}>
            <Button type="primary" size="large" style={{ width: '200px' }} onClick={() => navigate("/consumer-registration")}>
              Find a Manufacturer
            </Button>
          </div>
        </div>

        <div style={{ position: 'relative' }} className="image-section">
          <img
            src={`/images/interface-parts.png`}
            style={{ height: '35vw' }}
            alt=""
          />
          {/* Dashboard Mockup */}
          <Card style={{ position: 'absolute', right: '0', top: '200px', width: '300px' }} />
        </div>
      </div>
    </div>
   </ManufacturerStyledSearch>
  );
};

export default ManufacturerSearch;
