// CustomSpinner.js
import React from 'react';
import { Spin } from 'antd';

const customSpinnerStyle = {
  display: 'inline-block',
  fontSize: '40px',
  width: '40px',
  height: '40px',
  border: '4px solid rgba(0, 0, 0, 0.1)',
  borderTop: '4px solid #1890ff', // Customize the color as needed
  borderRadius: '50%',
  animation: 'spin 1s linear infinite',
};

const CustomSpinner = ({ tip = "Loading...", size = "large" }) => (
  <div style={{ textAlign: 'center' }}>
    <div style={customSpinnerStyle}></div>
    <div>{tip}</div>
    <style>
      {`
        @keyframes spin {
          100% {
            transform: rotate(360deg);
          }
        }
      `}
    </style>
  </div>
);

export default CustomSpinner;
