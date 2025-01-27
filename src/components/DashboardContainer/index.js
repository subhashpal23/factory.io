import React from "react";
import { useNavigate } from "react-router-dom";
import { useSelector } from 'react-redux';
import AppHeader  from "../AppHeader";
import ResponsiveSidebar from "../Menu";
const DashboardContainer = () => {
    const navigate = useNavigate();
    const accessToken = localStorage.getItem('access_token');
    const userType = localStorage.getItem('user_type');

    const token = localStorage.getItem('access_token');
    const isUserLoggedIn = !!token;
    
    const { logindata, loginError } = useSelector((state) => state.auth);
    if (!logindata) {
        navigate('/');
    } else {
        console.log('loginData###', logindata)
    }
    return <>
        {isUserLoggedIn ? <ResponsiveSidebar userType ={logindata?.data?.role_type}/> : <></>}
        
    </>;
};
export default DashboardContainer;