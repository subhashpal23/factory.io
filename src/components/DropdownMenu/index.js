import React from 'react';
import styled from 'styled-components';
import Dropdown from "./../Dropdown/index";

// Styled Components
const NavBar = styled.nav`
  background-color: #1e3a8a; /* bg-blue-900 */
  color: white; /* text-white */
`;

const NavList = styled.ul`
  display: flex; /* flex */
  list-style-type: none; /* Removes bullets */
  color: white; /* Sets font color to white */
  li {
    margin-right: 1rem; /* Optional spacing between list items */
  }
`;

const DropdownMenu = () => {
  return (
    <NavBar>
      <NavList>
        <Dropdown
          title="Capabilities"
          options={[
            { label: "Casting", link: "/casting" },
            { label: "Forging", link: "/forging" },
            { label: "CNC Machining", link: "/cnc-machining" },
            { label: "PCB Assembly", link: "/pcb-assembly" },
            { label: "Sheet Metal Fabrication", link: "/sheet-metal" },
            { label: "Box Build", link: "/box-build" },
            { label: "Injection Moulding", link: "/injection-moulding" },
          ]}
        />
        <Dropdown
          title="Industries"
          options={[
            {label: "Automotive", link: "/automotive"},
            {label: "Aerospace", link: "/aerospace"},
            {label: "Electronics", link: "/electronics"},
            {label: "Medical", link: "/medical"},
          ]}
        />
        <Dropdown
          title="Resources"
          options={[
            {label: "Blog", link: "/blog"},
            {label: "Case Studies", link: "/case-studies"},
          ]}
        />
        <Dropdown
          title="Company"
          options={[
            {label: "About Us", link: "/about-us"},
            {label: "Culture & Careers", link: "/careers"},
            {label: "Contact Us", link: "/contact"},
            {label: "News", link: "/news"},
          ]}
        />
      </NavList>
    </NavBar>
  );
};

export default DropdownMenu;
