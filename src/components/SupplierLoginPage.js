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

const ForgotPassword = styled.a`
  color: #10b981;
  font-size: 0.875rem;
  text-decoration: underline;
`;

const SignUpLink = styled.a`
  color: #10b981;
  font-size: 0.875rem;
  text-decoration: underline;
  cursor: pointer;
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
          <Card>
            <SubHeading>Login</SubHeading>
            <Description>Welcome back!</Description>
            <form>
              <InputWrapper>
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
              </InputWrapper>
              <InputWrapper>
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
              </InputWrapper>
              <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '15px'}}>
                <label style={{ display: 'flex', alignItems: 'center', color: '#4b5563', fontSize: '14px' }}>
                  <input type="checkbox" style={{ marginRight: '0.5rem' }} />
                  Remember me
                </label>
                <ForgotPassword href="/">Forgot password?</ForgotPassword>
              </div>
              <Button
                type="submit"
                onClick={signInUser}>
                Log In
              </Button>
            </form>
            <p style={{ textAlign: 'center', color: '#6b7280', marginTop: '1rem' }} onClick={() => navigate('/supplier-registration')}>
              Don’t have an account?{" "}
              <SignUpLink>Sign Up</SignUpLink>
            </p>
          </Card>
        )}
      </RightSection>
    </Container>
  );
};

export default SupplierLoginPage;
