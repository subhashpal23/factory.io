import React from "react";
import { Link } from "react-router-dom";
import styled from "styled-components";

const Wrapper = styled.div`
  min-height: 60vh;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  text-align: center;
  padding: 40px 20px;
`;

const Title = styled.h1`
  font-size: 2rem;
  color: #111827;
  margin-bottom: 16px;
`;

const Text = styled.p`
  color: #4b5563;
  font-size: 1.1rem;
  margin-bottom: 20px;
`;

const HomeLink = styled(Link)`
  background: #0369a1;
  color: white;
  padding: 10px 18px;
  text-decoration: none;
  border-radius: 6px;
  font-weight: 500;
  transition: background 0.2s ease;

  &:hover {
    background: #024e7c;
  }
`;

const Blog = () => {
  return (
    <Wrapper>
      <Title>Blog : 🚧 Under Construction</Title>
      <Text>We're working hard to bring this page to life. Stay tuned!</Text>
      <HomeLink to="/">← Back to Home</HomeLink>
    </Wrapper>
  );
};

export default Blog;
