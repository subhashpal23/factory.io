import React, { useState, useEffect } from "react";
import { Menu, Dropdown, Button } from "antd";
import { useNavigate } from "react-router-dom";
import styled from "styled-components";
import { useDispatch } from "react-redux";
import { userLogout } from "../redux/actions/authAction";
import MobileNavigation from "../components/MobileNavigation";

const MegaMenuWrapper = styled.div`
  background: #fff;
  padding: 20px;
  width: 100vw;
  display: flex;
  flex-wrap: wrap;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
  position: absolute;
  left: 0;
  top: 100%;
  margin-top: -7px;
`;

const CategoryColumn = styled.div`
  flex: 1 1 calc(33.33% - 20px);
  margin: 10px;
  min-width: 250px;
`;

const CategoryTitle = styled.h3`
  color: #0068AD;
  font-weight: medium;
  border-bottom: 1px solid #C3C3C3;
  text-align: left;
  padding-bottom: 5px;
  cursor: pointer;
`;

const StyledMenu = styled(Menu)`
  box-shadow: none;
  margin-top: 16px;
  padding: 0px;
  text-align: start;
`;

const StyledMenuItem = styled(Menu.Item)`
  padding: 8px 12px;
`;

const TopMenuContainer = styled.div`
  background: #fff;
  padding: 10px 40px;
  display: flex;
  align-items: center;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  @media (max-width: 768px) {
    display: none;
  }
`;

const MobileMenuContainer = styled.div`
  display: none;
  @media (max-width: 768px) {
    display: flex;
    align-items: center;
    justify-content: space-between;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    background: #fff;
    padding: 10px;
    width: 100%;
  }
`;

const MegaMenu = ({ data, title }) => {
  console.log("MegaMenu data:", data);
  const navigate = useNavigate();
  const menu = (
    <MegaMenuWrapper>
      {Array.isArray(data) && data.length > 0 &&
        data.map((category, index) => (
          <CategoryColumn key={index}>
            <CategoryTitle onClick={() => category?.id && navigate(`/manufacturing/${category?.id}`|| '/')}>{category.title}</CategoryTitle>
            <StyledMenu mode="vertical">
              {Array.isArray(category.items) && category.items.map((item, i) => (
                <StyledMenuItem key={i}>
                  <a href={item.route || '/'}>{item.label}</a>
                </StyledMenuItem>
              ))}
            </StyledMenu>
          </CategoryColumn>
        ))}
    </MegaMenuWrapper>
  );

  return (
    <Dropdown overlay={menu} trigger={["hover"]} overlayStyle={{ width: '100%', position: 'absolute', left: '0', right: '0', top: '9vh', zIndex: 9999 }}>
      <Button type="text" style={{ fontSize: "20px", fontWeight: "bold", padding: "0px 10px" }}>{title}</Button>
    </Dropdown>
  );
};

const HeaderText = styled.div`
  font-size: 1.6rem;
  font-weight: bolder;
  cursor: pointer;
  color: #0056b3;
`;

const StyledButton = styled.button`
  border: 1px solid white;
  padding: 0.5rem 1rem;
  border-radius: 0.5rem;
  background-color: #2563eb;
  color: white;
  cursor: pointer;
  transition: all 0.3s ease;
  &:hover {
    background-color: #1e50c1;
  }
`;

const ConsumerButton = styled(StyledButton)`
  border: 1px solid #2563eb;
  color: #2563eb;
  background-color: transparent;
  &:hover {
    background-color: #2563eb;
    color: white;
  }
`;

const SupplierButton = styled(StyledButton)`
  border: 1px solid #2563eb;
  background-color: #2563eb;
  color: white;
  &:hover {
    background-color: white;
    color: #2563eb;
  }
`;

const TopNavigation = () => {
  const navigate = useNavigate();
  const dispatch = useDispatch();
  const accessToken = localStorage.getItem("access_token");
  const isUserLoggedIn = !!accessToken;
  const [manufacturingData, setManufacturingData] = useState([]);
  const [industryData, setIndustryData] = useState([
    { title: "Façade Industry", icon: "🚏" },
    { title: "Electronics", icon: "⚡" },
    { title: "Medical", icon: "⚕️" },
    { title: "Stone Industry", icon: "💎" },
    { title: "Woodworking", icon: "🪵" },
    { title: "Aluminum Industry", icon: "🟰" },
    { title: "Glass & Stone industry", icon: "🔋" },
    { title: "Marine Industry", icon: "🪼" },
    { title: "Defense", icon: "🪖" },
    { title: "Consumer", icon: "🛍️" },
    { title: "Oil and Gas", icon: "🛢️" },
    { title: "Power Generation", icon: "🔌" },
    { title: "Aerospace", icon: "🚀" },
    { title: "Consumer Goods", icon: "🏪" },
    { title: "Robotics", icon: "🤖" }
]);

  useEffect(() => {
    fetch("/manufacturingProcesses.json")
      .then((response) => response.json())
      .then((data) => setManufacturingData(Array.isArray(data) ? data : []))
      .catch(() => setManufacturingData([]));

    // fetch("/industryCategories.json")
    //   .then((response) => response.json())
    //   .then((data) => setIndustryData(Array.isArray(data) ? data : []))
    //   .catch(() => setIndustryData([]));
  }, []);

  return (
    <>
      <TopMenuContainer>
        <HeaderText 
          onClick={() => navigate("/")} 
          style={{ 
            display: 'flex', 
            alignItems: 'center', 
            justifyContent: 'center', 
            cursor: 'pointer', 
            textAlign: 'center' 
          }}
          >
          <img 
            src='/images/DigiFactory_ae_logo_.png' 
            alt="Logo" 
            style={{ width: '200px', height: 'auto' }} 
          />
          {/* DigiFactory.ae */}
      </HeaderText>
        <Menu mode="horizontal" style={{ borderBottom: "none", flex: 2, display: "flex", justifyContent: "flex-end", fontWeight: "bold", fontSize: "20px" }}>
          <Menu.Item key="services"><MegaMenu data={manufacturingData} title="Manufacturing Hub" /></Menu.Item>
          <Menu.Item key="supplier-search"><a href="/manufactor/search">Supplier Search</a></Menu.Item>
          <Menu.Item key="industries"><MegaMenu data={industryData} title="Industry" /></Menu.Item>
          <Menu.Item key="resources"><a href="/#how-it-works">How It Works</a></Menu.Item>
          <Menu.Item key="contact" onClick={() => navigate("/contact-us")}>Contact</Menu.Item>
        </Menu>
        <div style={{ flex: 1, display: "flex", justifyContent: "flex-end", gap: "15px" }}>
          {isUserLoggedIn ? (
            <StyledButton onClick={() => {
              localStorage.clear();
              dispatch(userLogout());
              navigate("/");
            }}>Logout</StyledButton>
          ) : (
            <>
              <ConsumerButton onClick={() => navigate("/consumer-login")}>Customer Login</ConsumerButton>
              <SupplierButton onClick={() => navigate("/supplier-login")}>Supplier Login</SupplierButton>
            </>
          )}
        </div>
      </TopMenuContainer>
      <MobileMenuContainer>
        <MobileNavigation />
      </MobileMenuContainer>
    </>
  );
};

export default TopNavigation;
