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

const Forging = () => {
  return (
    <>
    <TopNavigation />
    <Container>
      <TextContent>
        <Title>Casting</Title>
        <Description>
        Hot and cold forging processes produce durable components with excellent mechanical properties through controlled deformation of metals. Forged parts offer superior strength and structural integrity compared to cast or machined alternatives.
	Shape metal through controlled deformation to create parts with superior strength and durability. Our forging processes manipulate metal at specific temperatures to achieve optimal grain structure and mechanical properties. The result is components with exceptional toughness and resistance to impact and fatigue
        </Description>

        <SectionTitle>Applications</SectionTitle>
        <List>
          <li>•	Engine blocks</li>
          <li>•	Machinery housings</li>
          <li>•	Artistic components</li>
          <li>•	Structural parts</li>
        </List>

        <SectionTitle>Materials</SectionTitle>
        <MaterialTags>
          <Tag>Aluminum</Tag>
          <Tag>Steel</Tag>
          <Tag>Bronze</Tag>
          <Tag>Zinc</Tag>
          <Tag>Magnesium</Tag>
        </MaterialTags>

        <Button>Find CNC Suppliers</Button>
      </TextContent>

      <ImagePlaceholder><img  height={400} width={800} src="./../images/front/casting-2.jpg" alt="CNC machining placeholder"/></ImagePlaceholder>
    </Container>
    <Footer/>
    </>
  );
};

export default Forging;
