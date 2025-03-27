import React from "react";
import styled from "styled-components";

import TopNavigation  from "./../TopNavigation";
import Footer from "./../Footer";

const Container = styled.div`
  padding: 100px 200px;
  margin: auto;
  display: flex;
  flex-direction: column;
  gap: 20px;

  @media (min-width: 768px) {
    flex-direction: row;
    align-items: center;
  }
`;

const TextContent = styled.div`
  flex: 2;
`;

const Title = styled.h2`
  font-size: 1.5rem;
  font-weight: bold;
  margin-bottom: 10px;
`;

const Description = styled.p`
  color: #555;
  margin-bottom: 15px;
  max-width: 700px;
`;

const SectionTitle = styled.h3`
  font-size: 1.2rem;
  font-weight: 600;
  margin-top: 10px;
`;

const List = styled.ul`
  list-style: disc;
  padding-left: 20px;
  color: #555;
`;

const MaterialTags = styled.div`
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
  margin-top: 8px;
`;

const Tag = styled.span`
  background: #e0f2fe;
  color: #0369a1;
  padding: 6px 12px;
  border-radius: 20px;
  font-size: 0.9rem;
`;

const Button = styled.button`
  background: #0369a1;
  color: white;
  padding: 10px 16px;
  border: none;
  border-radius: 6px;
  font-size: 1rem;
  cursor: pointer;
  margin-top: 16px;
  transition: background 0.2s ease;

  &:hover {
    background: #024e7c;
  }
`;

const ImagePlaceholder = styled.div`
  flex: 1;
  background: #d1d5db;
  width: 250px;
  height: 150px;
  display: flex;
  justify-content: center;
  align-items: center;
  color: #4b5563;
  border-radius: 10px;
  font-size: 0.9rem;
`;

const CNCMachining = () => {
  return (
    <>
    <TopNavigation />
    <Container>
      <TextContent>
        <Title>CNC Machining</Title>
        <Description>
          Computer Numerical Control (CNC) machining uses computerized controls to operate 
          machine tools that cut and shape stock material with high precision. Ideal for 
          both prototype and production runs with excellent surface finishes.
        </Description>

        <SectionTitle>Applications</SectionTitle>
        <List>
          <li>Aerospace components</li>
          <li>Automotive parts</li>
          <li>Medical devices</li>
          <li>Industrial equipment</li>
        </List>

        <SectionTitle>Materials</SectionTitle>
        <MaterialTags>
          <Tag>Aluminum</Tag>
          <Tag>Steel</Tag>
          <Tag>Stainless Steel</Tag>
          <Tag>Brass</Tag>
          <Tag>Titanium</Tag>
          <Tag>Plastics</Tag>
        </MaterialTags>

        <Button>Find CNC Suppliers</Button>
      </TextContent>

      <ImagePlaceholder><img  height={400} width={800} src="./../images/front/CNC-machining1.png" alt="CNC machining placeholder"/></ImagePlaceholder>
    </Container>
    <Footer/>
    </>
  );
};

export default CNCMachining;
