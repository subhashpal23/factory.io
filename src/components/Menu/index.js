import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useDispatch } from 'react-redux';
import { Layout, Menu, Drawer, Button, theme, Typography, Avatar, Dropdown  } from 'antd';
import { AppstoreAddOutlined, SearchOutlined,  UploadOutlined,SmileOutlined,
  UserOutlined,
  VideoCameraOutlined,
  MenuFoldOutlined,
  MenuUnfoldOutlined,SolutionOutlined, BellOutlined, UnorderedListOutlined
} from '@ant-design/icons';
import { MenuItems } from '../Registration/constants';
import { userLogout } from '../../redux/actions/authAction';
import { UserRole } from '../../types/enums';

const ResponsiveSidebar = ({userType}) => {
  const navigate = useNavigate();
  const dispatch = useDispatch();
  const [selectedKey, setSelectedKey] = useState(MenuItems.filter(i=>i.role_type === userType).reduce((min, item) => {
    return item.id < min ? item.id : min;
  }, Infinity))
  const [visible, setVisible] = useState(false);
  const [collapsed, setCollapsed] = useState(false);
  const { Title } = Typography;
  const { Header, Sider, Content } = Layout;
  const {
    token: { colorBgContainer, borderRadiusLG },
  } = theme.useToken();
  const showDrawer = () => {
    setVisible(true);
  };

  const closeDrawer = () => {
    setVisible(false);
  };

  const toggleCollapsed = () => {
    setCollapsed(!collapsed);
  };

  //const menuItems = MenuItems.filter(i => i.role_type === userType).map(i => {return {key: i.id,label: i.label,icon: i.iconLabel}})
  const menuItems = MenuItems.filter(i => i.role_type === userType).map(i => ({
    key: i.id,
    label: (
      <span style={{ fontSize: '15px', padding:"2px 4px", color: '#ffffff', letterSpacing:"0.8px" }}>
        {i.label}
      </span>
    ),
    icon: React.cloneElement(i.iconLabel, { style: { fontSize: '15px', padding:"2px 0px", color: '#ffffff' } }),
  }));
  
  const renderSideMenuComponent = () => {
    const sideMenuSelected = MenuItems.find(i=>i.id === parseInt(selectedKey))
    return sideMenuSelected.component;
  };




  const handleSideMenuClick = ({ key }) => {
    setSelectedKey(key);
  }

  // const renderSideMenuComponent = () => {
  //   const sideMenuSelected = MenuItems.find(i => i.id === parseInt(selectedKey));
  //   if (!sideMenuSelected) return null;
  //   const Component = sideMenuSelected.component;
  //   return <Component someProp="someValue" anotherProp="anotherValue" />;
  // };

  const handleProfileMenuClick = ({ key }) => {
    // if (key === 'profile') {
    //   console.log('Profile clicked');
    // } else if (key === 'settings') {
    //   console.log('Settings clicked');
    // } 
    if (key === 'logout') {
              localStorage.clear();
              dispatch(userLogout());
              navigate('/')
              console.log('Logout clicked');
    }
  };
  const profileMenu = (
    <Menu onClick={handleProfileMenuClick}>
      {/* <Menu.Item key="profile">
        <span>View Profile</span>
      </Menu.Item> */}
      {/* <Menu.Item key="settings">
        <span>Settings</span>
      </Menu.Item> */}
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
         // Set custom background color
        }}
        > 
        <div
          style={{
            textAlign: 'center',
          }}
        >
          <Title level={2} style={{
                  padding:'16px',
                  marginTop:'10px',
                  fontSize: '26px',
                  color: 'white',
                  fontFamily: 'Roboto, sans-serif', // Roboto font applied
            }}>Factory.io</Title>
        </div>
            {console.log('@selectedKey',selectedKey)}
        <Menu
          theme="dark"
          mode="inline"
          defaultSelectedKeys={[`${selectedKey}`]}
          items = {menuItems}
          style={{backgroundColor: '#212631', margin:"5px 0px"}}
          onClick={handleSideMenuClick}
        />

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
          <div style={{width:'100%',display:'flex', justifyContent:'space-between'}}>
            <div style={{display:'flex',justifyContent: 'center', alignItems:'center'}}>
              {userType === UserRole.CONSUMER ? <span style={{fontSize:'16px'}}> Customer Dashboard</span> : <span>Seller Dashboard</span>}
              <span style={{fontSize:'15px',marginLeft:'10px'}}>  Settings </span>
            </div>
            <div style={{marginRight:"20px",display:'flex',justifyContent:'center',alignItems:'center'}}>
              <BellOutlined style={{ fontSize: '22px', cursor: 'pointer', margin:"0px 16px"}}/>
              <Dropdown overlay={profileMenu} trigger={['hover', 'click']}>
                <Avatar
                  style={{ cursor: 'pointer' }}
                  icon={<UserOutlined />}
                  size="medium"
                />
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
