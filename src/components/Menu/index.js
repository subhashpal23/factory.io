import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useDispatch } from 'react-redux';
import { Layout, Menu, Button, theme, Typography, Avatar, Dropdown } from 'antd';
import { UnorderedListOutlined, BellOutlined, UserOutlined } from '@ant-design/icons';
import { MenuItems } from '../Registration/constants';
import { userLogout } from '../../redux/actions/authAction';
import { UserRole } from '../../types/enums';

const { SubMenu } = Menu;

const ResponsiveSidebar = ({ userType }) => {
  const navigate = useNavigate();
  const dispatch = useDispatch();
  const [selectedKey, setSelectedKey] = useState(MenuItems.filter(i => i.role_type === userType).reduce((min, item) => {
    return item.id < min ? item.id : min;
  }, Infinity));
  const [collapsed, setCollapsed] = useState(false);
  const { Title } = Typography;
  const { Header, Sider, Content } = Layout;
  const {
    token: { colorBgContainer, borderRadiusLG },
  } = theme.useToken();

  const toggleCollapsed = () => {
    setCollapsed(!collapsed);
  };

  const renderMenuItems = (items) => {
    return items.map(item => {
      if (item.children) {
        return (
          <SubMenu
            key={item.id}
            icon={React.cloneElement(item.iconLabel, { style: { fontSize: '15px', padding: '2px 0px', color: '#ffffff' } })}
            title={<span style={{ fontSize: '15px', padding: '2px 4px', color: '#ffffff', letterSpacing: '0.8px' }}>{item.label}</span>}
          >
            {renderMenuItems(item.children)}
          </SubMenu>
        );
      }
      return (
        <Menu.Item key={item.id}>
          <span style={{ fontSize: '15px', padding: '2px 4px', color: '#ffffff', letterSpacing: '0.8px' }}>{item.label}</span>
        </Menu.Item>
      );
    });
  };

  // const renderSideMenuComponent = () => {
  //   const sideMenuSelected = MenuItems.flatMap(i => i.children ? i.children : [i]).find(i => i.id === parseInt(selectedKey));
  //   if (!sideMenuSelected) {
  //     console.error('Component not found for selected key:', selectedKey);
  //     return <div>Component not found</div>;
  //   }
  //   return React.cloneElement(sideMenuSelected.component, { handleSideMenuClick });
  // };

  const renderSideMenuComponent = () => {
    const sideMenuSelected = MenuItems.flatMap(i => i.children ? i.children : [i]).find(i => i.id === parseInt(selectedKey));
    if (!sideMenuSelected) {
      console.error('Component not found for selected key:', selectedKey);
      return <div>Component not found</div>;
    }
    return React.cloneElement(sideMenuSelected.component, { ...sideMenuSelected.props });
  };

  const handleSideMenuClick = ({ key }) => {
    setSelectedKey(key);
  };

  const handleProfileMenuClick = ({ key }) => {
    if (key === 'logout') {
      localStorage.clear();
      dispatch(userLogout());
      navigate('/');
    }
  };

  const profileMenu = (
    <Menu onClick={handleProfileMenuClick}>
      <Menu.Item key="logout">
        <span>Logout</span>
      </Menu.Item>
    </Menu>
  );

  return (
    <Layout style={{ minHeight: '100vh' }}>
      <Sider
        trigger={null}
        collapsible
        collapsed={collapsed}
        width={255}
        style={{
          backgroundColor: '#212631',
        }}
      >
        <div style={{ textAlign: 'center' }}>
          <Title
            level={2}
            style={{
              padding: '16px',
              marginTop: '10px',
              fontSize: '26px',
              color: 'white',
              fontFamily: 'Roboto, sans-serif',
            }}
          >
            Factory.io
          </Title>
        </div>
        <Menu
          theme="dark"
          mode="inline"
          defaultSelectedKeys={[`${selectedKey}`]}
          style={{ backgroundColor: '#212631', margin: '5px 0px' }}
          onClick={handleSideMenuClick}
        >
          {renderMenuItems(MenuItems.filter(i => i.role_type === userType))}
        </Menu>
      </Sider>
      <Layout>
        <Header
          style={{
            display: 'flex',
            padding: 0,
            background: colorBgContainer,
          }}
        >
          <Button
            type="text"
            icon={<UnorderedListOutlined />}
            onClick={() => setCollapsed(!collapsed)}
            style={{
              fontSize: '20px',
              width: 64,
              height: 64,
            }}
          />
          <div style={{ width: '100%', display: 'flex', justifyContent: 'space-between' }}>
            <div style={{ display: 'flex', justifyContent: 'center', alignItems: 'center' }}>
              {userType === UserRole.CONSUMER && <span style={{ fontSize: '16px' }}> Customer Dashboard</span>}
              {userType === UserRole.SUPPLIER && <span style={{ fontSize: '16px' }}> Supplier Dashboard</span>}
              {userType === UserRole.SUPER_ADMIN && <span style={{ fontSize: '16px' }}> Admin Dashboard</span>}
              <span style={{ fontSize: '15px', marginLeft: '10px' }}> Settings </span>
            </div>
            <div style={{ marginRight: '20px', display: 'flex', justifyContent: 'center', alignItems: 'center' }}>
              <BellOutlined style={{ fontSize: '22px', cursor: 'pointer', margin: '0px 16px' }} />
              <Dropdown overlay={profileMenu} trigger={['hover', 'click']}>
                <Avatar style={{ cursor: 'pointer' }} icon={<UserOutlined />} size="medium" />
              </Dropdown>
            </div>
          </div>
        </Header>
        <Content
          style={{
            margin: '24px 16px',
            padding: 24,
            minHeight: 280,
            background: colorBgContainer,
            borderRadius: borderRadiusLG,
          }}
        >
          {renderSideMenuComponent()}
        </Content>
      </Layout>
    </Layout>
  );
};

export default ResponsiveSidebar;
