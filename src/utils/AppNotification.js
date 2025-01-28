// AppNotification.js
import { notification } from 'antd';
// import 'antd/dist/antd.css';

const openNotification = (type, message, description) => {
  notification[type]({
    message: message,
    description: description,
    className: type === 'error' ? 'custom-error-notification' : 'custom-success-notification',
  });
};

const showErrorNotification = (message, description) => {
  openNotification('error', message, description);
};

const showSuccessNotification = (message, description) => {
  openNotification('success', message, description);
};

// Add custom styles
const styles = `
  .custom-error-notification {
    background-color: #E32227 !important;
    color: white !important;
  }
  .custom-error-notification .ant-notification-notice-message,
  .custom-error-notification .ant-notification-notice-description {
    color: white !important;
  }
  .custom-error-notification .ant-notification-notice-close {
    color: white !important;
  }
  .custom-error-notification .anticon-close {
    color: white !important;
  }

  .custom-success-notification {
    background-color: #2E6F40 !important;
    color: white !important;
  }
  .custom-success-notification .ant-notification-notice-message,
  .custom-success-notification .ant-notification-notice-description {
    color: white !important;
  }
  .custom-success-notification .ant-notification-notice-close {
    color: white !important;
  }
  .custom-success-notification .anticon-close {
    color: white !important;
  }
`;

// Append styles to document head
const styleSheet = document.createElement("style");
styleSheet.type = "text/css";
styleSheet.innerText = styles;
document.head.appendChild(styleSheet);

export { showErrorNotification, showSuccessNotification };
