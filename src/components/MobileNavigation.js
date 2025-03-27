import React, { useState } from 'react';
import { MenuOutlined, CloseOutlined, SearchOutlined, DownOutlined, LeftOutlined, UserOutlined } from '@ant-design/icons';
import { Button, Drawer } from 'antd';
import styled from "styled-components";
import { useNavigate } from "react-router-dom";
import ManufacturerSearch from './ManufacturerSearch';
import HowItWorks from './HowItWorks';

const Container = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  gap: 8%;
  padding: 0px 40px;
`;

const HeaderText = styled.div`
  font-size: 1.6rem;
  font-weight: bolder;
`;

const submenus = {
    "Manufacturer Hub": [
        {
          title: 'Injection Molding Service',
          items: [
            'Plastic Injection Molding',
            'Liquid Silicone Rubber Molding',
            'Overmolding and Insert Molding',
            'Prototyping',
            'Production',
            'Quality',
            'Secondary Operations'
          ]
        },
        {
          title: 'CNC Machining Service',
          items: [
            'CNC Milling',
            'CNC Turning',
            'Production Machining',
            'Precision Machining',
            'Threading Options',
            'Finishing Options'
          ]
        },
        '3D Printing Service'
      ],
    Industry: [
      'Automotive',
      'Aerospace',
      'Medical'
    ],
    "How It Works": [
      'Blog',
      'Case Studies',
      'Webinars'
    ],
    'Contact Us': [
      'Our Story',
      'Careers',
      'Contact Us'
    ]
  };

const MobileNavigation = () => {
  const navigate = useNavigate();
  const [isOpen, setIsOpen] = useState(false);
  const [submenu, setSubmenu] = useState(null);

  const toggleMenu = () => {
    setIsOpen(!isOpen);
    setSubmenu(null);
  };

  const openSubmenu = (menu) => setSubmenu(menu);
  const closeSubmenu = () => setSubmenu(null);

  const getMenuItems = (menu) => {
    return submenus[menu].flatMap(item =>
      typeof item === 'string' ? item : [<div onClick={() => navigate("/manufactoring/cnc-machining")} key={item.title} style={{ fontWeight: 'bold', padding: '8px 0' }}>{item.title}</div>, ...(item.items || [])]
    );
  };

  return (
    <Container>
      <Button type="text" onClick={toggleMenu} icon={isOpen ? <CloseOutlined /> : <MenuOutlined />} />
      <HeaderText onClick={() => navigate("/")}>DigiFactory.io</HeaderText>
      <Button type="text" onClick={toggleMenu} icon={<UserOutlined />} />
      <Drawer
        title={
          submenu ? (
            <div style={{ display: 'flex', alignItems: 'center' }} onClick={closeSubmenu}>
              <LeftOutlined style={{ marginRight: 8 }} /> Back
            </div>
          ) : (
            'Menu'
          )
        }
        placement="left"
        onClose={toggleMenu}
        open={isOpen}
      >
         <div style={{ textAlign: 'center', marginBottom: 24 }}>
           <HeaderText onClick={() => navigate("/")}>DigiFactory.io</HeaderText>
        </div>
        {!submenu ? (
          <ul style={{ listStyle: 'none', padding: 0 }}>
            {Object.keys(submenus).map((menu) => (
              <li key={menu}>
                <span onClick={() => openSubmenu(menu)} style={{ display: 'block', padding: '8px 0' }}>{menu}</span>
              </li>
            ))}
          </ul>
        ) : (
          <ul style={{ listStyle: 'none', padding: 0 }}>
            {getMenuItems(submenu).map((item, index) => (
              <li key={index}>
                <span onClick={toggleMenu} style={{ display: 'block', padding: '8px 0' }}>{item}</span>
              </li>
            ))}
          </ul>
        )}
      </Drawer>
    </Container>
  );
};

export default MobileNavigation;
