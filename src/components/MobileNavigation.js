import React, { useState, useEffect } from 'react';
import { MenuOutlined, CloseOutlined, LeftOutlined, UserOutlined } from '@ant-design/icons';
import { Button, Drawer } from 'antd';
import styled from "styled-components";
import { useNavigate } from "react-router-dom";
import { useDispatch } from "react-redux";
import { userLogout } from "../redux/actions/authAction";

const Container = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  gap: 30px;
  padding: 0px 40px;
  position: relative;
`;

const HeaderText = styled.div`
  font-size: 1.6rem;
  font-weight: bolder;
  cursor: pointer;
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

const MobileNavigation = () => {
  const navigate = useNavigate();
  const [isOpen, setIsOpen] = useState(false);
  const [submenu, setSubmenu] = useState(null);
  const [isLoginDrawerOpen, setIsLoginDrawerOpen] = useState(false);
  const accessToken = localStorage.getItem("access_token");
  const isUserLoggedIn = !!accessToken;
  const dispatch = useDispatch();

  const [manufacturingData, setManufacturingData] = useState([]);
  const [industryData, setIndustryData] = useState([
    { title: "Automotive", icon: "🚏" },
    { title: "Electronics", icon: "⚡" },
    { title: "Medical", icon: "⚕️" },
    { title: "Stone Industry", icon: "💎" },
    { title: "Woodworking", icon: "🪵" },
    { title: "Heavy Machinery", icon: "🟰" },
    { title: "Renewable Energy", icon: "🔋" },
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
  }, []);

  const toggleMenu = () => {
    setIsOpen(!isOpen);
    setSubmenu(null);
  };

  const openSubmenu = (menu) => setSubmenu(menu);
  const closeSubmenu = () => setSubmenu(null);

  const openLoginDrawer = () => setIsLoginDrawerOpen(true);
  const closeLoginDrawer = () => setIsLoginDrawerOpen(false);

  const handleLoginNavigate = (type) => {
    closeLoginDrawer();
    navigate(`/${type}-login`);
  };

  const renderSubmenuItems = () => {
    if (submenu === "Manufacturer Hub") {
      return manufacturingData.map((category, index) => (
        <React.Fragment key={index}>
          <div onClick={() => {
              toggleMenu();
              navigate(`/manufacturing/${category.id}`);
            }} style={{ padding: '8px 0' }}>{category.title}</div>
          {(category.items || []).map((item, idx) => (
            <div key={idx} onClick={() => toggleMenu()} style={{ padding: '6px 0 6px 12px' }}>{item}</div>
          ))}
        </React.Fragment>
      ));
    }

    if (submenu === "Industry") {
      return industryData.map((industry, index) => (
        <div key={index} onClick={toggleMenu} style={{ padding: '8px 0' }}>
          {industry.icon} {industry.title}
        </div>
      ));
    }

    if (submenu === "How It Works") {
      return ['Blog', 'Case Studies', 'Webinars'].map((item, index) => (
        <div key={index} onClick={toggleMenu} style={{ padding: '8px 0' }}>{item}</div>
      ));
    }

    if (submenu === "Contact Us") {
      return ['Our Story', 'Careers', 'Contact Us'].map((item, index) => (
        <div key={index} onClick={toggleMenu} style={{ padding: '8px 0' }}>{item}</div>
      ));
    }

    return null;
  };

  return (
    <Container>
      <Button type="text" onClick={toggleMenu} icon={isOpen ? <CloseOutlined /> : <MenuOutlined />} />
      
      <HeaderText onClick={() => navigate("/")}>DigiFactory.ae</HeaderText>

      <Button type="text" icon={<UserOutlined />} onClick={openLoginDrawer} />

      {/* Navigation Drawer */}
      <Drawer
        title={
          submenu ? (
            <div style={{ display: 'flex', alignItems: 'center' }} onClick={closeSubmenu}>
              <LeftOutlined style={{ marginRight: 8 }} /> Back
            </div>
          ) : (
            ''
          )
        }
        placement="left"
        onClose={toggleMenu}
        open={isOpen}
      >
        <div style={{ textAlign: 'center', marginBottom: 24 }}>
          <HeaderText onClick={() => navigate("/")}>DigiFactory.ae</HeaderText>
        </div>
        {!submenu ? (
          <ul style={{ listStyle: 'none', padding: 0, fontSize: '16px' }}>
            {['Manufacturer Hub', 'Industry', 'How It Works', 'Contact Us'].map((menu) => {
              let content;
              switch (menu) {
                case "Manufacturer Hub":
                case "Industry":
                  content = (
                    <span onClick={() => openSubmenu(menu)} style={{ display: 'block', padding: '8px 0', fontWeight: 'bold', cursor: 'pointer' }}>
                      {menu}
                    </span>
                  );
                  break;
                case "How It Works":
                case "Contact Us":
                  content = (
                    <span style={{ display: 'block', padding: '8px 0', fontWeight: 'bold', cursor: 'pointer' }}>
                      <a style={{ display: 'block', fontWeight: 'bold', cursor: 'pointer', color:"black" }} href={menu === "How It Works" ? "/#how-it-works" : "/contact-us"}>{menu}</a>
                    </span>
                  );
                  break;
                default:
                  content = <span style={{ display: 'block', padding: '8px 0' }}>{menu}</span>;
              }
              return <li key={menu}>{content}</li>;
            })}
          </ul>
        ) : (
          <ul style={{ listStyle: 'none', padding: 0 }}>
            {renderSubmenuItems()}
          </ul>
        )}
      </Drawer>

      {/* Login Drawer */}
      <Drawer
        //title="Login Options"
        placement="right"
        onClose={closeLoginDrawer}
        open={isLoginDrawerOpen}
      >
        <div style={{ display: 'flex', flexDirection: 'column', gap: '16px' }}>
         {isUserLoggedIn ? (
                     <StyledButton onClick={() => {
                       localStorage.clear();
                       dispatch(userLogout());
                       closeLoginDrawer();
                       navigate("/");
                     }}>Logout</StyledButton>
                   ) : (
                     <>
                       <ConsumerButton onClick={() => navigate("/consumer-login")}>Customer Login</ConsumerButton>
                       <SupplierButton onClick={() => navigate("/supplier-login")}>Supplier Login</SupplierButton>
                     </>
                   )}
        </div>
      </Drawer>
    </Container>
  ); 
};

export default MobileNavigation;
