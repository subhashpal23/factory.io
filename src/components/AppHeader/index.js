import React from "react";
import { useNavigate } from "react-router-dom";
import styled from "styled-components";
import DropdownMenu from "../DropdownMenu";
import { useDispatch, useSelector } from "react-redux";
// import { userLogout } from "./../redux/actions/authAction";
import { userLogout } from "../../redux/actions/authAction";
const AppHeader = () =>{
    const navigate = useNavigate();
    const dispatch = useDispatch();
    const accessToken = localStorage.getItem('access_token');
    const userType = localStorage.getItem('user_type');
    const isUserLoggedIn = !!accessToken; // Boolean check for token presence
  
    const onLogoutClick = () => {
        localStorage.clear();
        dispatch(userLogout());
        navigate('/')
    }

    return(<>
        <header>
            <Header>
                <HeaderText>Factory.io</HeaderText>
                { !isUserLoggedIn ? <StyledDropdownContainer> 
                    <DropdownMenu />
                </StyledDropdownContainer>: <></> }
                { isUserLoggedIn ? 
                     <ButtonWrapper>
                        <StyledButton onClick={onLogoutClick}>Logout</StyledButton>
                   </ButtonWrapper>
                : <ButtonLoginWrapper>
                     <ConsumerButton onClick={() => navigate('/consumer-login')}>
                        Customer Login
                    </ConsumerButton>
                    <SupplierButton onClick={() => navigate('/supplier-login')}>
                        Supplier Login
                    </SupplierButton>
                  </ButtonLoginWrapper>}
            </Header>
        </header>
    </>)
}

export default AppHeader;

const Header = styled.div`
  background-color: #1e3a8a; 
  color: white; 
  display: flex; 
  align-items: center; 
  justify-content: space-between; 
  padding: 1.9rem 2rem; 
  flex-direction: column; 
  gap: 1rem; 
  margin-left: auto; 
  margin-right: auto; 

  /* Media query for md:flex-row */
  @media (min-width: 768px) {
    flex-direction: row; /* md:flex-row */
    gap: 0; /* gap-0 */
  }
`;


const HeaderText = styled.div`
  font-size: 1.6rem; 
  font-weight: bolder;
`;

const StyledDropdownContainer = styled.div`
  display: none; /* hidden */
  
  @media (min-width: 1024px) { /* lg breakpoint in Tailwind (1024px) */
    display: flex; /* flex */
  }
`;

const ButtonWrapper = styled.div`
  display: flex;
  gap: 1rem; /* space-x-4 in tailwind */
`;


const StyledButton = styled.button`
  border: 1px solid white;
  padding: 0.5rem 1rem; /* px-4 py-2 in tailwind */
  border-radius: 0.5rem; /* rounded-lg in tailwind */
  background-color: transparent;
  color: white;
  cursor: pointer;
  transition: all 0.3s ease;

  &:hover {
    background-color: white;
    color: #1e3a8a; /* blue-900 in tailwind */
  }
`;


const ButtonLoginWrapper = styled.div`
  display: flex;
  gap: 1rem; /* space-x-4 in tailwind */
`;

const StyledLoginButton = styled.button`
  padding: 0.5rem 1rem; /* px-4 py-2 in tailwind */
  border-radius: 0.5rem; /* rounded-lg in tailwind */
  cursor: pointer;
  transition: all 0.3s ease;
`;


const ConsumerButton = styled(StyledLoginButton)`
  border: 1px solid white;
  color: white;
  background-color: transparent;

  &:hover {
    background-color: white;
    color: #1e3a8a; /* blue-900 in tailwind */
  }
`;

// Supplier Login Button with specific styles
const SupplierButton = styled(StyledLoginButton)`
 border: 1px solid #2563eb; 
 background-color: #2563eb; /* bg-blue-600 in tailwind */
  color: white;

  &:hover {
    background-color: #1d4ed8; /* bg-blue-700 in tailwind */
  }
`;
