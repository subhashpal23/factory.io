import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { useDispatch, useSelector } from 'react-redux';
import { Layout, Menu, Button, theme, Typography, Avatar, Dropdown } from 'antd';
import { UnorderedListOutlined, BellOutlined, UserOutlined } from '@ant-design/icons';
import { MenuItems } from '../Registration/constants';
import { userLogout } from '../../redux/actions/authAction';
import { UserRole } from '../../types/enums';
import { getUserInfo } from '../../redux/actions/userActions';
import { SettingOutlined, LogoutOutlined, PlusOutlined } from "@ant-design/icons";

const { SubMenu } = Menu;

const ResponsiveSidebar = ({ userType }) => {
  const navigate = useNavigate();
  const dispatch = useDispatch();
  const [selectedKey, setSelectedKey] = useState( localStorage?.getItem('selectedKey') ?? MenuItems.filter(i => i.role_type === userType).reduce((min, item) => {
    return item.id < min ? item.id : min;
  }, Infinity));
  const [collapsed, setCollapsed] = useState(false);
  const { Title } = Typography;
  const { Header, Sider, Content } = Layout;
  const {
    token: { colorBgContainer, borderRadiusLG },
  } = theme.useToken();
  
  const token = useSelector((state) => state.auth.logindata.token);
  const userDetail = useSelector((state) => state.user.userDetail);

  useEffect(() => {
        if (token) {
          dispatch(getUserInfo(token));
        }
  }, [dispatch, token]);

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
    localStorage.setItem('selectedKey', key)
  };

  const handleProfileMenuClick = ({ key }) => {
    if (key === 'logout') {
      localStorage.clear();
      dispatch(userLogout());
      navigate('/');
    }
  };

  // const profileMenu = (
  //   <Menu onClick={handleProfileMenuClick}>
  //     <Menu.Item key="logout">
  //       <div style={{display: 'flex', textAlign: "center"}}>
  //       <span>{userDetail?.name}</span>
  //       <span>Logout</span>
  //       </div>
  //     </Menu.Item>
  //   </Menu>
  // );
  const getInitials = (name) => {
    if (!name) return "U"; // Default fallback
    const words = name.trim().split(" ");
    return words.length > 1
      ? words[0][0] + words[1][0] // First letter of first & last word
      : words[0].substring(0, 2); // First two letters if only one word
  };

  const profileMenu = (
    <Menu onClick={handleProfileMenuClick} style={{ minWidth: 200 }}>
      {/* User Info */}
      <Menu.Item key="profile" style={{ display: "flex", alignItems: "center", gap: 10 }}>
      <Avatar size="small" style={{ backgroundColor: "green", color: "white", fontWeight: "bold" }}>
      {userDetail?.avatar ? (
        <img src={userDetail.avatar} alt="Avatar" />
      ) : (
        getInitials(userDetail?.name)
      )}
    </Avatar>
        <span style={{margin: '5px'}}>{userDetail?.name}</span>
      </Menu.Item>
  
      <Menu.Divider />
  
      {/* Notifications */}
      <Menu.Item key="notifications" icon={<BellOutlined />}>
        Notifications
      </Menu.Item>
  
      {/* Settings */}
      <Menu.Item key="settings" icon={<SettingOutlined />}>
        Settings
      </Menu.Item>
  
      {/* Logout */}
      <Menu.Item key="logout" icon={<LogoutOutlined />}>
        Log Out
      </Menu.Item>
  
      <Menu.Divider />
  
      {/* Other Profiles */}
      {userDetail?.profiles?.map((profile) => (
        <Menu.Item key={profile.id} style={{ display: "flex", alignItems: "center", gap: 10 }}>
          <Avatar src={profile.avatar} size="small" />
          <span>{profile.name}</span>
          {profile.isActive && <span style={{ color: "orange", marginLeft: "auto" }}>●</span>}
        </Menu.Item>
      ))}
    </Menu>
  );
  
  const ProfileDropdown = () => (
    <Dropdown overlay={profileMenu} trigger={["click"]}>
      <a onClick={(e) => e.preventDefault()}>
        <Avatar src={userDetail?.avatar} size="large" /> {/* Profile Avatar */}
      </a>
    </Dropdown>
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
            DigiFactory.io
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
