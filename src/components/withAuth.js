import React from 'react';
import { Navigate } from 'react-router-dom';
import Header from './Header';

const withAuth = (Component) => {
  const AuthComponent = (props) => {
    const isAuthenticated = true; // Replace with your actual authentication logic

    return isAuthenticated ? (
      <>
        <Header />
        <Component {...props} />
      </>
    ) : (
      <Navigate to="/consumer-login" /> // Redirect to consumer-login if not authenticated
    );
  };

  return AuthComponent;
};

export default withAuth;
