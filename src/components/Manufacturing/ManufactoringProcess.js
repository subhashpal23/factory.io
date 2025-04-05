import React, { useState, useEffect } from "react";
import styled from "styled-components";
import TopNavigation from "./../TopNavigation";
import Footer from "./../Footer";
import { useNavigate } from 'react-router-dom';

// Styled Components
const Container = styled.div`
  padding: 100px 120px;
  margin: auto;
  display: flex;
  flex-direction: column;
  gap: 20px;

  @media (min-width: 768px) {
    flex-direction: row;
    align-items: center;
    margin: auto;
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
  width: 250px;
  height: 150px;
  display: flex;
  //justify-content: center;
  align-items: center;
  color: #4b5563;
  border-radius: 10px;
  font-size: 0.9rem;
   @media (min-width: 768px) {
    justify-content: normal;
  }
`;

const ManufacturingProcess = ( processId ) => {

  const [process, setProcess] = useState(null);
   const navigate = useNavigate();

  useEffect(() => {
    // Fetch data from local JSON file or API
    fetch("/manufacturingProcesses.json")
      .then((response) => response.json())
      .then((data) => {
        console.log('@@data',data);
        const selectedProcess = data.find((p) => p.id === processId?.processId);
        setProcess(selectedProcess);
      });
  }, [processId?.processId]);

  if (!process) return <p>Loading...</p>;

  return (
    <>
      <TopNavigation />
      <Container>
        <TextContent>
          <Title>{process.title}</Title>
          <Description>{process.description}</Description>

          <SectionTitle>Applications</SectionTitle>
          <List>
            {process.applications.map((item, index) => (
              <li key={index}>{item}</li>
            ))}
          </List>

          <SectionTitle>Materials</SectionTitle>
          <MaterialTags>
            {process.materials.map((material, index) => (
              <Tag key={index}>{material}</Tag>
            ))}
          </MaterialTags>

          <Button onClick={() => navigate('/supplier-registration')}>Find {process.title} Suppliers</Button>
        </TextContent>

        <ImagePlaceholder>
          <img height={400} width={500} src={process.image} alt={process.title} />
        </ImagePlaceholder>
      </Container>
      <Footer />
    </>
  );
};

export default ManufacturingProcess;
