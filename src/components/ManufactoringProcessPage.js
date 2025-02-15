import React from "react";
import { Layout, Menu, Dropdown, Input, Button, Card, Checkbox, List, Tag , Typography, Space, Col, Row} from "antd";
import { DownOutlined, SearchOutlined, StarFilled} from "@ant-design/icons";

import TopNavigation  from "./TopNavigation";
import FilterByLocation from "./FilterLocation";

const { Header, Sider, Content } = Layout;
const { Title, Text } = Typography;

const manufacturers = [
  {
    name: "Bowden Manufacturing",
    location: "Ohio",
    type: "Job Shop / Contract Manufacturer",
    employees: "50-99",
    description:
      "Bowden Manufacturing is a Veteran-Owned, Small Business CNC Machine Shop that supplies components...",
  },
  {
    name: "SK International",
    location: "Michigan",
    type: "Job Shop / Contract Manufacturer",
    employees: "50-99",
    description: "A leading manufacturer specializing in CNC machining...",
  },
  {
    name: "Xcelicut Precision Machining",
    location: "Pennsylvania",
    type: "Job Shop / Contract Manufacturer",
    employees: "3-9",
    description: "Located in Latrobe, Pennsylvania, Xcelicut Precision Machining is an ISO9001:2015 certified CNC machine shop... ",
  },
];

const countryMenu = (
  <Menu>
    <Menu.Item>United States</Menu.Item>
    <Menu.Item>Canada</Menu.Item>
  </Menu>
);

const categoryMenu = (
  <Menu>
    <Menu.Item>CNC Machining</Menu.Item>
    <Menu.Item>3D Printing</Menu.Item>
    <Menu.Item>Injection Molding</Menu.Item>
  </Menu>
);

const ManufactoringProcessPage = () => {
  return (
    <>
    <Layout style={{ minHeight: "100vh", width: "100vw"}}>
    <TopNavigation />
    <h1 level={2} style={{ fontWeight: "bold", margin: "auto", textAlign: "center", padding: "20px 30px 0px 40px" }}>
     The Best Manufacturers Make Parts Here
        </h1>
        <h4 level={2} style={{ color: "#46556C", fontWeight: "normal", margin: "auto", textAlign: "center", padding: "5px 30px 30px 10px" }}>
        Find the best manufacturer for every part, every time.
        </h4>
      <div style={{ display: "flex", justifyContent: "center", alignItems: "center", background: "none", width: "100%" }}>
        <Space size="large" style={{ display: "flex", justifyContent: "center"  }}>
          <Dropdown overlay={countryMenu} trigger={["click"]}>
            <Button>
              United States <DownOutlined />
            </Button>
          </Dropdown>
          <Dropdown overlay={categoryMenu} trigger={["click"]}>
            <Button>
              CNC Machining <DownOutlined />
            </Button>
          </Dropdown>
          <Input placeholder="Keywords" prefix={<SearchOutlined />} style={{ width: 200 }} />
          <Button type="primary">Search Manufacturers</Button>
        </Space>
      </div>
      <Header style={{ display: "flex", justifyContent: "center", alignItems: "center", background: "none", width: "100%", fontWeight: "normal" }}>
      <Space size="small" wrap>
        <Text style={{ fontSize: 18 }}>8,117</Text>
        <Tag color="default" style={{ fontSize: 16, padding: "4px 12px", textAlign:"center", justifyContent: "center", display:"flex", backgroundColor: "#E7E7E7", borderRadius: "20px" }}>CNC Machining</Tag>
        <Text style={{ fontSize: 16 }}>Shops -</Text>
        <Button size="small" style={{ background: "#6C757D", border: "none", color: "white", padding: "0px 8px" }}>
          Reset Search
        </Button>
      </Space>
      </Header>
      <div style={{ display: "flex", justifyContent: "center", alignItems: "center", background: "none", width: "100%" }}>
      <Space size="large" wrap>
      <div>
        <Text medium style={{margin: "10px"}}>Manufacturing Location:</Text>
        <Tag color="default" style={{ fontSize: 14, padding: "2px 8px", backgroundColor: "#E7E7E7", borderRadius: "20px" }}>United-States</Tag>
      </div>
      </Space>
      </div>
      <Layout style={{ display: "flex", justifyContent: "center", alignItems: "center", width: "100%", minHeight: "100vh" }}>
      <Layout style={{ display: "flex", width: "80%", maxWidth: "1200px" }}>
        <Sider width="25%" style={{ background: "none", padding: "14px 40px" }}>
          <FilterByLocation />
        </Sider>

        <Content style={{ padding: "14px 40px", flex: 1, marginLeft: "30px" }}>
          <List
            grid={{ gutter: 16, column: 1 }}
            dataSource={manufacturers}
            renderItem={(item) => (
              <List.Item>
                <Card
                  style={{
                    borderRadius: "10px",
                    boxShadow: "0px 2px 8px rgba(0, 0, 0, 0.1)",
                    padding: "5px",
                  }}
                >
                  <Row justify="space-between" align="top">
                    {/* Left Section: Manufacturer Details */}
                    <Col xs={24} md={16}>
                      <Title strong level={4} style={{ marginBottom: 0 }}>
                        {item.name}
                      </Title>

                      {/* Rating */}
                      <Text strong style={{ fontSize: "14px", color: "#333" }}>
                        <StarFilled style={{ color: "#fadb14", marginRight: "5px" }} />
                        4.94 <span style={{ color: "gray" }}>(33)</span>
                      </Text>

                      <Text type="secondary" style={{ display: "block", marginTop: "5px" }}>
                        {item.location} | {item.type} | {item.employees}
                      </Text>

                      <p style={{ marginTop: "10px", color: "#555" }}>{item.description}</p>
                      <Text strong style={{ color: "#1890ff", cursor: "pointer" }}>+ Read More</Text>

                      {/* Tags */}
                      <Row style={{ marginTop: "10px" }} gutter={8}>
                        <Col>
                          <Tag
                            style={{
                              padding: "5px 10px",
                              borderRadius: "15px",
                              background: "#f0f2f5",
                            }}
                          >
                            Machining
                          </Tag>
                        </Col>
                        <Col>
                          <Tag
                            style={{
                              padding: "5px 10px",
                              borderRadius: "15px",
                              background: "#f0f2f5",
                            }}
                          >
                            DigiFactory Verified? Yes
                          </Tag>
                        </Col>
                        <Col>
                          <Tag
                            style={{
                              padding: "5px 10px",
                              borderRadius: "15px",
                              background: "#f0f2f5",
                            }}
                          >
                            United States-Based Manufacturing
                          </Tag>
                        </Col>
                      </Row>
                    </Col>
                    <Col xs={24} md={8} style={{ textAlign: "right" }}>
                      <div style={{ marginBottom: "10px" }}>
                        <img src="/images/badges/badge-iso.svg" alt="Badge 3" style={{ height: "30px", marginRight: "5px" }} />
                        <img src="/images/badges/badge-1.svg" alt="Badge 1" style={{ height: "30px", marginRight: "5px" }} />
                        <img src="/images/badges/badge-2.svg" alt="Badge 2" style={{ height: "30px", marginRight: "5px" }} />
                        <img src="/images/badges/badge-3.svg" alt="Badge 3" style={{ height: "30px", marginRight: "5px" }} />
                      </div>
                      <Button type="primary" size="large" style={{ marginBottom: "10px" }}>
                        View More Details
                      </Button>
                      <br />
                      <Checkbox>Compare</Checkbox>
                    </Col>
                  </Row>
                </Card>
              </List.Item>
            )}
          />
        </Content>

      </Layout>
    </Layout>
    </Layout></>
  );
};

export default ManufactoringProcessPage;
