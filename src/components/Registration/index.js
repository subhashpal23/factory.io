import React, {useState} from 'react';
import { useDispatch, useSelector } from "react-redux";
import { useLocation, useNavigate } from 'react-router-dom';
import { UserRole } from '../../types/enums';
import styled from 'styled-components';
import { userRegister,refreshRegistrationState, userLogout } from "./../../redux/actions/authAction";
import { CountryCodes, industriesType } from './constants';
import TopNavigation  from "../../components/TopNavigation";
import Footer from "../../components/Footer";

const RegistrationPage = ({user_type}) => {
  const dispatch = useDispatch();
 
  const { registrationData, registrationError, laoding } = useSelector((state) => state.auth);
  const registrationEmptyState = {
    name: '',
    company: '',
    email: '',
    password: '',
    phone_number: '',
    industry: '',
    marketing_consent: false
  };
  const errorsEmptyState = {
    name: '',
    company: '',
    email: '',
    password: '',
    phone_number: '',
    industry: '',
    marketing_consent: '',
    country_code: ''
  };
  const [registration, setRegistration] = React.useState({ ...registrationEmptyState });
//   const dal = useDal();
  const [errors, setErrors] = React.useState({ ...errorsEmptyState });
  const location = useLocation();
  const { pathname } = location;
  const navigate = useNavigate();

  const validateForm = () => {
    const newErrors = {};
    if (!registration.name) newErrors.name = 'Name is required.';
    if (!registration.company) newErrors.company = 'Company name is required.';
    if (!registration.email) newErrors.email = 'Email is required.';
    else if (!/\S+@\S+\.\S+/.test(registration.email))
      newErrors.email = 'Invalid email format.';
    if (!registration.password) newErrors.password = 'Password is required.';
    if (!registration.phone_number)
      newErrors.phone_number = 'Phone number is required.';
    if (!registration.industry)
      newErrors.industry = 'Industry selection is required.';
    if (!registration.marketing_consent)
      newErrors.marketing_consent = 'You must agree to terms & conditions.';

    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  };

  const registerUser = async (e) => {
    e.preventDefault();
    if (!validateForm()) return;
    const userType = user_type === 'consumer' ? UserRole.CONSUMER : UserRole.SUPPLIER;
    try {
      dispatch(userRegister(registration,userType))
    } catch (err) {
      // Handle error
    }
  };

  if (registrationData) {
    const registrationStatus = registrationData?.status;
    if (!registrationStatus) {
      window.alert(registrationData.message || '');
    } else {
      localStorage.clear();
      dispatch(userLogout());
      if (registrationData?.data?.role_type === UserRole.CONSUMER) {
        navigate('/consumer-login')
      }
      else if (registrationData?.data?.role_type === UserRole.SUPPLIER) {
        navigate('/supplier-login')
      }
    }

    setTimeout(() => {
      dispatch(refreshRegistrationState());
    }, 1000); // Dispatches after 1 second
  }
  
  if(registrationError){
  }

  return (
    <>
    <TopNavigation />
    <Container>
      {/* Left Section */}
      <LeftSection>
        <h1>DigiFactory.io</h1>
        <p>Manufacturing is easy with DigiFactory.ae</p>
        <div>
          <Feature>
            <Icon>
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth="2" stroke="currentColor" className="w-6 h-6">
                <path strokeLinecap="round" strokeLinejoin="round" d="M17 9V7a4 4 0 00-8 0v2m-3 0a2 2 0 012-2h10a2 2 0 012 2v7a2 2 0 01-2 2H6a2 2 0 01-2-2V9z"/>
              </svg>
            </Icon>
            <p>Fair Pricing</p>
          </Feature>
          <Feature>
            <Icon>
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth="2" stroke="currentColor" className="w-6 h-6">
                <path strokeLinecap="round" strokeLinejoin="round" d="M12 8c-3.866 0-7 2.91-7 6.5s3.134 6.5 7 6.5 7-2.91 7-6.5-3.134-6.5-7-6.5z"/>
              </svg>
            </Icon>
            <p>Quality Assurance</p>
          </Feature>
          <Feature>
            <Icon>
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth="2" stroke="currentColor" className="w-6 h-6">
                <path strokeLinecap="round" strokeLinejoin="round" d="M4 16v1a1 1 0 001 1h3m10-6l3 3m-4-3a1 1 0 00-1 1v3m0-4a1 1 0 011-1h3M4 4v5h.01M4 10h.01"/>
              </svg>
            </Icon>
            <p>Build Fast. Learn Fast</p>
          </Feature>
          <Feature>
            <Icon>
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth="2" stroke="currentColor" className="w-6 h-6">
                <path strokeLinecap="round" strokeLinejoin="round" d="M9 17v2a1 1 0 001 1h4a1 1 0 001-1v-2m1 0a3 3 0 00-3-3H9a3 3 0 00-3 3v2m4-10h4"/>
              </svg>
            </Icon>
            <p>Massive Manufacturing Capacity</p>
          </Feature>
        </div>
      </LeftSection>

      {/* Right Section */}
      <RightSection>
        <FormContainer>
          <h2 style={{marginBottom:"16px", color:"#1F2937"}}>Sign up for an account</h2>
          <form onSubmit={registerUser}>
            {/* Name */}
            <InputField>
              <Label style={{ marginBottom: "6px" }}>Name *</Label>
              <Input
                type="text"
                placeholder="Your name"
                required
                onChange={(e) => setRegistration({ ...registration, name: e.target.value })}
                style={{
                  padding: '0.75rem',
                  borderRadius: '5px',
                  border: '1px solid #1A3E8A',
                  fontSize: '13px',
                  backgroundColor: '#f9fafb',
                  color: '#333',
                  height: '36px',
                  //marginBottom: "5px"
              }}
            />
          {errors.name && <Error>{errors.name}</Error>}
          </InputField>

            {/* Company */}
            <InputField>
              <Label>Company *</Label>
              <Input
                type="text"
                placeholder="Company name"
                required
                onChange={(e) => setRegistration({ ...registration, company: e.target.value })}
                style={{
                  padding: '0.75rem',
                  borderRadius: '5px',
                  border: '1px solid #1A3E8A',
                  fontSize: '13px',
                  backgroundColor: '#f9fafb',
                  color: '#333',
                  height: '38px',
                  //marginBottom: "8px"
              }}
              />
              {errors.company && <Error>{errors.company}</Error>}
            </InputField>

            {/* Email */}
            <InputField>
              <Label>Email *</Label>
              <Input
                type="email"
                placeholder="Company email"
                required
                onChange={(e) => setRegistration({ ...registration, email: e.target.value })}
                style={{
                  padding: '0.75rem',
                  borderRadius: '5px',
                  border: '1px solid #1A3E8A',
                  fontSize: '13px',
                  backgroundColor: '#f9fafb',
                  color: '#333',
                  height: '38px',
                  //marginBottom: "8px"
              }}
              />
              {errors.email && <Error>{errors.email}</Error>}
            </InputField>

            {/* Password */}
            <InputField>
              <Label>Password *</Label>
              <Input
                type="password"
                placeholder="Password"
                required
                onChange={(e) => setRegistration({ ...registration, password: e.target.value })}
                style={{
                  padding: '0.75rem',
                  borderRadius: '5px',
                  border: '1px solid #1A3E8A',
                  fontSize: '13px',
                  backgroundColor: '#f9fafb',
                  color: '#333',
                  height: '38px',
                  //marginBottom: "8px"
                }}
              />
              {errors.password && <Error>{errors.password}</Error>}
            </InputField>

            <InputField>
              <Label>Location *</Label>
              <PhoneContainer>
                <Select
                  onChange={(e) => setRegistration({ ...registration, country_code: e.target.value?.split('@@')?.[0], country: e.target.value?.split('@@')?.[1] })}
                  style={{
                    borderRadius: '5px',
                    border: '1px solid #1A3E8A',
                    fontSize: '13px',
                    backgroundColor: '#f9fafb',
                    color: '#333',
                    height: '38px',
                    width:'60%',
                    marginRight: '2%'
                    }}
                >
                  <option value="">Country</option>
                  {CountryCodes.map((country, index) => (
                    <option key={index} value={`${country.code}@@${country.name}`}>
                      {country.name}
                    </option>
                  ))}
                </Select>
                <Input
                  type="text"
                  placeholder="State"
                  required
                  onChange={(e) => setRegistration({ ...registration, state: e.target.value })}
                  style={{
                    padding: '0.75rem',
                    borderRadius: '5px',
                    border: '1px solid #1A3E8A',
                    fontSize: '13px',
                    backgroundColor: '#f9fafb',
                    color: '#333',
                    height: '38px',
                  }}
                />
              </PhoneContainer>
              {errors.country && <Error>{errors.country}</Error>}
              {errors.state && <Error>{errors.state}</Error>}
            </InputField>
            {/* Phone Number with Country Code */}
            <InputField>
              <Label>Phone number *</Label>
              <PhoneContainer>
                {/* <Select
                  onChange={(e) => setRegistration({ ...registration, country_code: e.target.value })}
                  style={{
                    borderRadius: '5px',
                    border: '1px solid #1A3E8A',
                    fontSize: '13px',
                    backgroundColor: '#f9fafb',
                    color: '#333',
                    height: '38px',
                    width:'30%',
                    }}
                >
                  <option value="">Code</option>
                  {CountryCodes.map((country, index) => (
                    <option key={index} value={country.code}>
                      {country.name} ({country.code})
                    </option>
                  ))}
                </Select> */}
                <Input
                  type="text"
                  placeholder="Phone number"
                  required
                  onChange={(e) => setRegistration({ ...registration, phone_number: e.target.value })}
                  style={{
                    padding: '0.75rem',
                    borderRadius: '5px',
                    border: '1px solid #1A3E8A',
                    fontSize: '13px',
                    backgroundColor: '#f9fafb',
                    color: '#333',
                    height: '38px',
                  }}
                />
              </PhoneContainer>
              {errors.country_code && <Error>{errors.country_code}</Error>}
              {errors.phone_number && <Error>{errors.phone_number}</Error>}
            </InputField>

            {/* Industry */}
            <InputField>
              <Label>Industry</Label>
              <Select
                onChange={(e) => setRegistration({ ...registration, industry: e.target.value })}
                style={{
                  padding: '0.75rem',
                  borderRadius: '5px',
                  border: '1px solid #1A3E8A',
                  fontSize: '13px',
                  backgroundColor: '#f9fafb',
                  color: '#333',
                  height: '38px',
                  //marginBottom: "8px"
              }}
              >
                <option value="">Select</option>
                {industriesType.map((type, index) => (
                  <option key={index} value={type}>{type}</option>
                ))}
              </Select>
              {errors.industry && <Error>{errors.industry}</Error>}
            </InputField>

            {/* Agreement */}
            <Agreement>
              <Checkbox
                type="checkbox"
                required
                onChange={(e) => setRegistration({ ...registration, marketing_consent: e.target.checked })}
                style={{
                  width: '16px',
                  height: '16px', // Adjust size to make it larger
                  cursor: 'pointer', // Optional: Improve usability
                }}
              />
              <Label style={{marginBottom: "0rem"}}>I agree to the <a href="#"><span style={{marginLeft:"5px", color:"#2563EB"}}>terms & conditions</span></a></Label>
            </Agreement>

            <SubmitButton type="submit">Sign up</SubmitButton>
          </form>

          <LoginLink>
            <span style={{color:"#4b5563"}}>Already have an account?{' '}</span>
            <a href="" onClick={() => navigate(pathname.includes('customer') ? '/consumer-login' : '/supplier-login')}>
              <span style={{fontSize:'12px', color:"#2563EB"}}>Login</span>
            </a>
          </LoginLink>
        </FormContainer>
      </RightSection>
    </Container>
    <Footer/>
    </>
  );
};

const Container = styled.div`
  display: flex;
  height: 100vh;

  @media (max-width: 768px) {
    flex-direction: column;
    height: auto;
  }
`;

const LeftSection = styled.div`
  width: 50%;
  background-color: #1e3a8a;
  color: white;
  display: flex;
  flex-direction: column;
  justify-content: center;
  padding: 2rem;
  @media (max-width: 768px) {
    display: none;
  }
`;

const Feature = styled.div`
  display: flex;
  align-items: center;
  margin-bottom: 1.5rem;
`;

const Icon = styled.span`
  background-color: white;
  color: #1e3a8a;
  border-radius: 50%;
  padding: 0.75rem;
  margin-right: 1rem;
`;

const RightSection = styled.div`
  width: 50%;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #f9fafb;

  @media (max-width: 768px) {
    width: 100%;
    margin: 0 auto;
    padding: 1rem; /* Add some padding for better spacing */
  }
`;

const FormContainer = styled.div`
  width: 90%;
  max-width: 500px;
  background-color: white;
  padding: 2rem;
  border-radius: 10px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
  height: 90%;
  overflow: auto;
  max-height:700px;
  @media (max-width: 768px) {
    width: 80vw;
    height: auto;
    margin: 4%;
  }
`;

const InputField = styled.div`
  margin-bottom: 1rem;
`;

const Label = styled.label`
  font-size: 0.875rem;
  color: #4b5563;
  margin-bottom: 0.25rem;
`;

const Input = styled.input`
  width: 100%;
  padding: 0.75rem;
  border: 1px solid #ddd;
  border-radius: 5px;
  font-size: 1rem;
  background-color: #f9fafb;
`;

const Select = styled.select`
  width: 100%;
  padding: 0.5rem;
  border: 1px solid #ddd;
  border-radius: 5px;
  font-size: 1rem;
  background-color: #f9fafb;
`;

const PhoneContainer = styled.div`
  display: flex;

  `;

const Checkbox = styled.input`
  margin-right: 0.5rem;
`;

const Agreement = styled.div`
  display: flex;
  align-items: center;
  margin-top: 1rem;
  margin-bottom: 1rem;
`;

const Error = styled.div`
  color: #d9534f;
  font-size: 0.875rem;
  margin-top: 0.25rem;
`;

const SubmitButton = styled.button`
  width: 100%;
  padding: 8px 0px;
  background-color: #2563eb;
  color: white;
  font-size: 14px;
  border-radius: 5px;
  border: none;
  cursor: pointer;
  height: 34px;
`;

const LoginLink = styled.p`
  font-size: 0.875rem;
  color: #6b7280;
  margin-top: 1rem;
  text-align: center;
`;

export default RegistrationPage;
