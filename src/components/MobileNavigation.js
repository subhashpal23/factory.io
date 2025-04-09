import React, { useState, useEffect } from 'react';
import { MenuOutlined, CloseOutlined, LeftOutlined, UserOutlined } from '@ant-design/icons';
import { Button, Drawer } from 'antd';
import styled from "styled-components";
import { useNavigate } from "react-router-dom";

const Container = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  gap: 30px;
  padding: 0px 40px;
`;

const HeaderText = styled.div`
  font-size: 1.6rem;
  font-weight: bolder;
`;

const MobileNavigation = () => {
  const navigate = useNavigate();
  const [isOpen, setIsOpen] = useState(false);
  const [submenu, setSubmenu] = useState(null);

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

  const renderSubmenuItems = () => {
    if (submenu === "Manufacturer Hub") {
      return manufacturingData.map((category, index) => (
        <React.Fragment key={index}>
          <div onClick={() => {
              toggleMenu();
              navigate(`/manufacturing/${category.id}`);
            }} style={{ padding: '8px 0' }}>{category.title}</div>
          {(category.items || []).map((item, idx) => (
            <div key={idx} onClick={() => {
              toggleMenu();
            }} style={{ padding: '6px 0 6px 12px' }}>{item}</div>
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
      <Button type="text" onClick={toggleMenu} icon={<UserOutlined />} />
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
               content = (
                 <span onClick={() => openSubmenu(menu)} style={{ display: 'block', padding: '8px 0', fontWeight: 'bold', cursor: 'pointer' }}>
                   {menu}
                 </span>
               );
               break;
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
                 <span
                   /*onClick={() => {
                     toggleMenu();
                     const route = menu === "How It Works" ? "/#how-it-works" : "/contact-us";
                     navigate(route);
                   }}*/
                   style={{ display: 'block', padding: '8px 0', fontWeight: 'bold', cursor: 'pointer' }}
                 >
                   <a style={{ display: 'block', fontWeight: 'bold', cursor: 'pointer', color:"black" }} href={menu === "How It Works" ? "/#how-it-works" : "/contact-us"}>{menu}</a>
                 </span>
               );
               break;
             default:
               content = (
                 <span style={{ display: 'block', padding: '8px 0' }}>{menu}</span>
               );
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
    </Container>
  );
};

export default MobileNavigation;
