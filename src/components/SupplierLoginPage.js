import React, {useEffect, useState} from "react";
import { useNavigate } from "react-router-dom";
import styled from "styled-components";
import { useDispatch, useSelector } from "react-redux";
import { userLogin,userLogout } from "./../redux/actions/authAction";
import { UserRole } from './../types/enums'
import CustomSpinner from "../utils/CustomSpinner";
import { showErrorNotification } from "../utils/AppNotification";

// Styled components
const Container = styled.div`
  display: flex;
  height: 100vh;
`;

const LeftSection = styled.div`
  width: 50%;
  background-color: #dcfce7;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: flex-start;
  padding: 2.5rem;
`;

const RightSection = styled.div`
  flex: 1;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: white;
  position: relative;
`;

const Card = styled.div`
  width: 100%;
  max-width: 28rem;
`;

const Heading = styled.h1`
  font-size: 2rem;
  font-weight: bold;
  color: #2c6b44;
  margin-bottom: 1.5rem;
`;

const SubHeading = styled.h2`
  font-size: 1.5rem;
  font-weight: bold;
  margin-bottom: 1rem;
  text-align: center;
`;

const Description = styled.p`
  color: #6b7280;
  margin-bottom: 1.5rem;
  text-align: center;
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

const Icon = styled.span`
  font-size: 1.5rem;
  color: #10b981;
  margin-right: 0.75rem;
`;

const Text = styled.span`
  font-size: 1rem;
`;

const InputWrapper = styled.div`
  margin-bottom: 1rem;
`;

const Label = styled.label`
  display: block;
  font-size: 0.875rem;
  font-weight: medium;
  color: #4b5563;
`;

const Input = styled.input`
  width: 100%;
  padding: 0.5rem;
  border-radius: 0.375rem;
  border: 1px solid #d1d5db;
  margin-top: 0.25rem;
  &:focus {
    outline: none;
    border-color: #34d399;
    box-shadow: 0 0 0 2px rgba(52, 211, 153, 0.5);
  }
`;

const Button = styled.button`
  width: 100%;
  padding: 0.75rem;
  background-color: #16a34a;
  color: white;
  border-radius: 0.375rem;
  font-weight: medium;
  border: none;
  cursor: pointer;
  &:hover {
    background-color:rgb(52, 134, 110);
  }
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

const ForgotPassword = styled.a`
   color: #2563eb;
  font-size: 0.875rem;
  text-decoration: underline;
`;

const SignUpLink = styled.a`
 color: #2563eb;
  font-size: 0.875rem;
  text-decoration: underline;
  cursor: pointer;
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


const SupplierLoginPage = () => {
  const [appLoading, setAppLoading] = useState(false);
  const dispatch = useDispatch(); 
  const { logindata, loginError, loading } = useSelector((state) => state.auth);
  const defaultState = { email: '', password: '' };
  const [userCreds, setUserCreds] = useState({ ...defaultState });
  
  const navigate = useNavigate();
  const signInUser = async (e) => {
    e.preventDefault(); // Prevent form submission
    try {
      setAppLoading(true)
      dispatch(userLogin(userCreds,UserRole.SUPPLIER))
    } catch (err) {
      showErrorNotification('Something went wrong!')
    }
  };
 
  useEffect(()=>{
    if(logindata && logindata.status){
      setAppLoading(false);
      localStorage.setItem('access_token', logindata.token);
      localStorage.setItem('user_type', UserRole.SUPPLIER);
      navigate('/dashboard');
    }else if(logindata &&  !logindata.status){
      setAppLoading(false);
      localStorage.clear();
      dispatch(userLogout());
      showErrorNotification(logindata.message);
    }
  },[logindata])
    
  return (
    <Container>
      {/* Left Section */}
      {/* <LeftSection>
        <div style={{ maxWidth: '28rem', margin: 'auto' }}>
          <Heading>Grow Your Business With DigiFactory.io</Heading>
          <List>
            <ListItem>
              <Icon>📦</Icon>
              <Text>Get New Orders</Text>
            </ListItem>
            <ListItem>
              <Icon>💰</Icon>
              <Text>Receive Timely Payment</Text>
            </ListItem>
            <ListItem>
              <Icon>🌍</Icon>
              <Text>Access to Global Customer Base</Text>
            </ListItem>
            <ListItem>
              <Icon>📝</Icon>
              <Text>Create Instant Quotations</Text>
            </ListItem>
            <ListItem>
              <Icon>👥</Icon>
              <Text>Easily Manage Customers</Text>
            </ListItem>
          </List>
        </div>
      </LeftSection> */}

      {/* Right Section */}
      <RightSection>
        {appLoading && <CustomSpinner tip="Loading..." />}
        {!appLoading && (
          <FormWrapper>
             <p style={{fontSize:'24px',color:"#333333", marginBottom:"18px"}}>Log In</p>
             <p style={{fontSize:'14px',color:"#333333", marginBottom:"18px"}}>Welcome back!</p>
            <form>
            <InputField>
                <label style={{fontSize:"14px", color:"#374151" ,fontWeight:"semibold"}}>Email</label>
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
              {/* <InputWrapper>
                <Label htmlFor="email">Email ID *</Label>
                <Input 
                type="email" 
                id="email" 
                placeholder="Enter Email Address"
                onChange={(e) =>
                  setUserCreds((prevState) => ({
                    ...prevState,
                    email: e.target.value,
                  }))
                }
                />
              </InputWrapper> */}
              {/* <InputWrapper>
                <Label htmlFor="password">Password *</Label>
                <div style={{ position: 'relative' }}>
                  <Input
                    type="password"
                    id="password"
                    placeholder="Password"
                    onChange={(e) =>
                      setUserCreds((prevState) => ({
                        ...prevState,
                        password: e.target.value,
                      }))
                    }
                  />
                  <button
                    type="button"
                    style={{
                      position: 'absolute',
                      right: '0.75rem',
                      top: '50%',
                      transform: 'translateY(-50%)',
                      background: 'none',
                      border: 'none',
                      color: '#6b7280',
                    }}
                  >
                    👁️
                  </button>
                </div>
              </InputWrapper> */}

              <InputField>
                <label style={{fontSize:"14px", color:"#374151" ,fontWeight:"bold"}}>Password</label>
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
              <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '15px'}}>
                <label style={{ display: 'flex', alignItems: 'center', color: '#4b5563', fontSize: '14px' }}>
                  <input type="checkbox" style={{ marginRight: '0.5rem' }} />
                  Remember me
                </label>
                <ForgotPassword href="/forgot-password">  <span style={{fontSize:'13px'}}>Forgot password?</span></ForgotPassword>
              </div>
              <LoginButton
                type="submit"
                onClick={signInUser}>
                Log In
              </LoginButton>
            </form>
            <p style={{ textAlign: 'center', color: '#6b7280', marginTop: '1rem' }} onClick={() => navigate('/supplier-registration')}>
            <span style={{fontSize:"13px"}}>Don’t have an account?{' '}</span>
              <SignUpLink>Sign Up</SignUpLink>
            </p>
          </FormWrapper>
        )}
      </RightSection>
    </Container>
  );
};

export default SupplierLoginPage;
