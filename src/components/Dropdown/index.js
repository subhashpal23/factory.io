import React, { useState } from "react";
import styled from "styled-components";

const DropdownContainer = styled.li`
  position: relative;
  &:hover .dropdown-menu {
    opacity: 1;
    transform: translateY(0);
    visibility: visible;
  }
`;

const DropdownButton = styled.button`
  padding: 0.5rem 1rem;
  background: transparent;
  border: none;
  cursor: pointer;
  outline: none;
  font-size: 1rem;
  color: white ;
`;

const DropdownMenu = styled.div`
  position: absolute;
  left: 0;
  margin-top: 0.5rem;
  width: 16rem;
  background: white;
  color: black;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  border-radius: 0.375rem;
  opacity: 0;
  transform: translateY(0.5rem);
  visibility: hidden;
  transition: all 0.3s ease-in-out;
  z-index: 10;
`;

const DropdownMenuItem = styled.a`
  padding: 0.5rem 1rem;
  display: block;
  text-decoration: none;
  color: black;
  border-bottom: 1px solid #e5e7eb;
  transition: color 0.3s;

  &:hover {
    color: #2563eb; /* Tailwind's blue-600 equivalent */
  }

  &:last-child {
    border-bottom: none;
  }
`;

const Dropdown = ({ title, options }) => {
  return (
    <DropdownContainer>
      <DropdownButton>{title}</DropdownButton>
      <DropdownMenu className="dropdown-menu">
        {options.map((option, index) => (
          <DropdownMenuItem key={index} href={option.link}>
            {option.label}
          </DropdownMenuItem>
        ))}
      </DropdownMenu>
    </DropdownContainer>
  );
};

export default Dropdown;
