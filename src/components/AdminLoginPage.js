import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { useDispatch, useSelector } from "react-redux";
import { userLogin, userLogout } from "../redux/actions/authAction";
import { UserRole } from '../types/enums'
import styled from 'styled-components';
import CustomSpinner from '../utils/CustomSpinner';
import { showErrorNotification } from '../utils/AppNotification';

const AdminLoginPage = () => {
  const navigate = useNavigate();
  const dispatch = useDispatch();
  const [appLoading, setAppLoading] = useState(false);
  const { logindata, loginError, loading } = useSelector((state) => state.auth);
  const defaultState = { email: '', password: '' };
  // const dal = useDal();
  const [userCreds, setUserCreds] = useState({ ...defaultState });

  useEffect(() => {
    if (logindata && logindata.status) {
      setAppLoading(false);
      localStorage.setItem('access_token', logindata.token);
      localStorage.setItem('user_type', UserRole.SUPER_ADMIN);
      navigate('/dashboard');
    } else if (logindata && !logindata.status) {
      setAppLoading(false);
      localStorage.clear();
      dispatch(userLogout());
      showErrorNotification(logindata.message)
    }
  }, [logindata]);

  const signInUser = async (e) => {
    e.preventDefault(); 
    try {
      setAppLoading(true);
      dispatch(userLogin(userCreds, UserRole.SUPER_ADMIN));
    } catch (err) {
      showErrorNotification('Invalid login credentilas');
    }
  };

  return (
    <Container>
      {/* Left Section */}
      <LeftSection>
        <h1 style={{ fontSize: "36px !important", marginBottom: "20px" }}>
          Manufacturing is easy with DigiFactory.io
        </h1>
        <List>
          <ListItem>
            <Icon>💵</Icon>
            <span>Fair Pricing</span>
          </ListItem>
          <ListItem>
            <Icon>✅</Icon>
            <span>Quality Assurance</span>
          </ListItem>
          <ListItem>
            <Icon>⚡</Icon>
            <span>Build Fast. Learn Fast</span>
          </ListItem>
          <ListItem>
            <Icon>🏭</Icon>
            <span>Massive Manufacturing Capacity</span>
          </ListItem>
        </List>
      </LeftSection>

      {/* Right Section */}
      <RightSection>
        {appLoading && (
          <SpinnerWrapper>
            <CustomSpinner tip="Loading..." />
          </SpinnerWrapper>
        )}
        {!appLoading && (
          <FormWrapper>
            <p style={{ fontSize: '24px', color: "#333333", marginBottom: "18px" }}>Log In</p>
            <p style={{ fontSize: '14px', color: "#333333", marginBottom: "18px" }}>Welcome back!</p>
            <form>
              <InputField>
                <label style={{ fontSize: "14px", color: "#374151", fontWeight: "semibold" }}>Email</label>
                <input
                  type="email"
                  placeholder="Enter your email"
                  style={{
                    padding: '0.75rem',
                    borderRadius: '5px',
                    border: '1px solid #1A3E8A',
                    fontSize: '13px',
                    backgroundColor: '#f9fafb',
                    color: '#333',
                    height: '38px',
                  }}
                  onChange={(e) =>
                    setUserCreds((prevState) => ({
                      ...prevState,
                      email: e.target.value,
                    }))
                  }
                />
              </InputField>
              <InputField>
                <label style={{ fontSize: "14px", color: "#374151", fontWeight: "bold" }}>Password</label>
                <div className="relative">
                  <input
                    type="password"
                    placeholder="Enter your password"
                    style={{
                      padding: '0.75rem',
                      borderRadius: '5px',
                      border: '1px solid #1A3E8A',
                      fontSize: '13px',
                      backgroundColor: '#f9fafb',
                      color: '#333',
                      height: '38px',
                      marginBottom: "8px"
                    }}
                    onChange={(e) =>
                      setUserCreds((prevState) => ({
                        ...prevState,
                        password: e.target.value,
                      }))
                    }
                  />
                  {/* <ShowButton>Show</ShowButton> */}
                </div>
              </InputField>
              <RememberMeWrapper>
                <label>
                  <input type="checkbox" className="mr-2" />
                  <span style={{ fontSize: "13px", marginLeft: "8px" }}>Remember me</span>
                </label>
                <ForgotPasswordLink onClick={() => navigate('/consumer-registration')}>
                  <span style={{ fontSize: '13px' }}>Forgot password?</span>
                </ForgotPasswordLink>
              </RememberMeWrapper>
              <LoginButton type="submit" onClick={signInUser}>
                Log In
              </LoginButton>
            </form>
            <SignupPrompt>
              <span style={{ fontSize: "13px" }}>Don’t have an account?{' '}</span>
              <SignUpLink onClick={() => navigate('/consumer-registration')}><span style={{ fontSize: "13px" }}>Sign Up</span></SignUpLink>
            </SignupPrompt>
          </FormWrapper>
        )}
      </RightSection>
    </Container>
  );
};

const Container = styled.div`
  display: flex;
  height: 100vh;
`;

const LeftSection = styled.div`
  width: 50%;
  background-color: #1e3a8a;
  color: white;
  display: flex;
  flex-direction: column;
  justify-content: center;
  padding: 2.5rem;
`;

const List = styled.ul`
  list-style-type: none;
  padding: 0;
  margin: 0;
`;

const ListItem = styled.li`
  display: flex;
  align-items: center;
  margin-bottom: 1rem;
`;

const Icon = styled.div`
  width: 2rem;
  height: 2rem;
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: white;
  color: #1e40af;
  border-radius: 50%;
  margin-right: 1rem;
`;

const RightSection = styled.div`
  width: 50%;
  background-color: white;
  display: flex;
  justify-content: center;
  align-items: center;
  position: relative;
`;

const SpinnerWrapper = styled.div`
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
`;

const FormWrapper = styled.div`
  width: 75%;
  max-width: 28rem;
`;

const InputField = styled.div`
  margin-bottom: 1rem;

  label {
    display: block;
    font-weight: 500;
    color: #4b5563;
    margin-bottom: 0.5rem;
  }

  input {
    width: 100%;
    padding: 0.5rem;
    border: 1px solid #d1d5db;
    border-radius: 0.5rem;
    outline: none;
    &:focus {
      border-color: #2563eb;
      box-shadow: 0 0 0 2px rgba(37, 99, 235, 0.2);
    }
  }
`;

const ShowButton = styled.button`
  position: absolute;
  right: 0.5rem;
  top: 50%;
  transform: translateY(-50%);
  color: #6b7280;
  cursor: pointer;
`;

const RememberMeWrapper = styled.div`
  display: flex;
  justify-content: space-between;
  margin-bottom: 1rem;
`;

const ForgotPasswordLink = styled.a`
  color: #2563eb;
  cursor: pointer;
  text-decoration: underline;
`;

const LoginButton = styled.button`
  width: 100%;
  background-color: #1e3a8a;
  color: white;
  padding: 0.5rem;
  border-radius: 0.5rem;
  border-color: none;
  font-weight: 500;
  border: none;
  cursor: pointer;
  &:hover {
    background-color: #1e40af;
  }
`;

const SignupPrompt = styled.p`
  margin-top: 1.5rem;
  color: #4b5563;
`;

const SignUpLink = styled.a`
  color: #2563eb;
  cursor: pointer;
  text-decoration: underline;
`;

export default AdminLoginPage;
