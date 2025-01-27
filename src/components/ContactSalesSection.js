import React, { useState } from "react";
import styled from "styled-components";

// Styled components
const Section = styled.section`
  padding-top: 8rem; /* py-32 in tailwind (32 * 0.25rem = 8rem) */
  padding-bottom: 8rem;
`;

const Container = styled.div`
  max-width: 100%;
  padding-left: 1.5rem; /* px-6 in tailwind */
  padding-right: 1.5rem;
  margin: 0 auto;
  text-align: center;
`;

const Heading = styled.h1`
  font-size: 4.5rem; /* text-7xl in tailwind */
  font-weight: 700; /* font-bold */
  margin-bottom: 1rem; /* mb-4 */
  color: white;
`;

const Subheading = styled.h5`
  font-size: 14px; /* text-lg in tailwind */
  color: rgb(55 65 81 / var(--tw-text-opacity, 1));
  
`;

const Button = styled.button`
  padding: 0.8rem 1.5rem; /* px-6 py-3 in tailwind */
  background-color: #2563EB; /* bg-blue-600 */
  color: white;
  border-radius: 0.4rem; /* rounded-lg */
  box-shadow: none;
  border: none;
  &:hover {
    background-color: #2b6cb0; /* hover:bg-blue-700 */
    cursor: pointer;
  }
`;

const ModalOverlay = styled.div`
  position: fixed;
  inset: 0;
  background-color: rgba(0, 0, 0, 0.5); /* bg-gray-900 bg-opacity-50 */
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 50;
`;

const ModalContent = styled.div`
  background-color: white;
  border-radius: 0.5rem; /* rounded-lg */
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
  padding: 1.5rem; /* p-6 */
  width: 100%;
  max-width: 32rem; /* max-w-lg */
`;

const ModalHeader = styled.div`
  display: flex;
  justify-content: space-between;
  align-items: center;
  border-bottom: 1px solid #e2e8f0; /* border-b */
  padding-bottom: 0.75rem; /* pb-3 */
  margin-bottom: 1rem; /* mb-4 */
`;

const ModalTitle = styled.h3`
  font-size: 1.25rem; /* text-xl */
  font-weight: 600; /* font-semibold */
`;

const CloseButton = styled.button`
  color: #6b7280; /* text-gray-500 */
  &:hover {
    color: #4b5563; /* hover:text-gray-800 */
  }
`;

const FormGroup = styled.div`
  margin-bottom: 1rem; /* mb-4 */
`;

const Label = styled.label`
  display: block;
  font-size: 1rem; /* text-gray-600 */
  font-weight: 500; /* font-medium */
  margin-bottom: 0.25rem; /* mb-1 */
`;

const Input = styled.input`
  width: 100%;
  padding: 0.5rem 1rem; /* px-4 py-2 */
  border-radius: 0.375rem; /* rounded-lg */
  border: 1px solid #e2e8f0; /* border */
  focus:outline: none;
  &:focus {
    ring: 2px solid #3182ce; /* focus:ring */
    border-color: #63b3ed; /* focus:border-blue-300 */
  }
`;

const Select = styled.select`
  width: 100%;
  padding: 0.5rem 1rem; /* px-4 py-2 */
  border-radius: 0.375rem; /* rounded-lg */
  border: 1px solid #e2e8f0; /* border */
  focus:outline: none;
  &:focus {
    ring: 2px solid #3182ce; /* focus:ring */
    border-color: #63b3ed; /* focus:border-blue-300 */
  }
`;

const Textarea = styled.textarea`
  width: 100%;
  padding: 0.5rem 1rem; /* px-4 py-2 */
  border-radius: 0.375rem; /* rounded-lg */
  border: 1px solid #e2e8f0; /* border */
  focus:outline: none;
  &:focus {
    ring: 2px solid #3182ce; /* focus:ring */
    border-color: #63b3ed; /* focus:border-blue-300 */
  }
`;

const SubmitButton = styled.button`
  padding: 0.5rem 1.5rem; /* px-6 py-2 */
  background-color: #3182ce; /* bg-blue-600 */
  color: white;
  border-radius: 0.5rem; /* rounded-lg */
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  &:hover {
    background-color: #2b6cb0; /* hover:bg-blue-700 */
  }
`;

const ContactSalesSection = () => {
  const [isModalOpen, setModalOpen] = useState(false);

  const toggleModal = () => setModalOpen(!isModalOpen);

  return (
    <Section>
      {/* Section Title */}
      <Container>
        <Heading>Manufacturing Simplified</Heading>
        <Subheading>Custom Parts | EMS | Product Assembly</Subheading>
      </Container>

      {/* Button */}
      <div style={{ textAlign: "center", marginTop: "1.5rem" }}>
        <Button onClick={toggleModal}>Contact Sales</Button>
      </div>

      {/* Modal */}
      {isModalOpen && (
        <ModalOverlay onClick={toggleModal}>
          <ModalContent onClick={(e) => e.stopPropagation()}>
            <ModalHeader>
              <ModalTitle>Contact Sales</ModalTitle>
              <CloseButton onClick={toggleModal}>✕</CloseButton>
            </ModalHeader>

            {/* Form */}
            <form>
              <FormGroup>
                <Label>Name <span style={{ color: 'red' }}>*</span></Label>
                <Input type="text" name="first-name" placeholder="Name" required />
              </FormGroup>

              <FormGroup>
                <Label>Email Address <span style={{ color: 'red' }}>*</span></Label>
                <Input type="email" name="email" placeholder="Your email" required />
              </FormGroup>

              <FormGroup>
                <Label>Mobile Phone Number <span style={{ color: 'red' }}>*</span></Label>
                <Input type="tel" name="phone" placeholder="Contact" required />
              </FormGroup>

              <FormGroup>
                <Label>Company Name <span style={{ color: 'red' }}>*</span></Label>
                <Input type="text" name="company-name" placeholder="Company" required />
              </FormGroup>

              <FormGroup>
                <Label>Which manufacturing process are you looking for? <span style={{ color: 'red' }}>*</span></Label>
                <Select name="manufacturing-process" required>
                  <option value="">—Please choose an option—</option>
                  <option value="CNC Machining">CNC Machining</option>
                  <option value="Sheet Metal">Sheet Metal</option>
                  <option value="Injection Moulding">Injection Moulding</option>
                  <option value="Casting">Casting</option>
                  <option value="Forging">Forging</option>
                  <option value="Electronics Integration">Electronics Integration</option>
                  <option value="Fabrication">Fabrication</option>
                  <option value="Proto Processes">Proto Processes</option>
                  <option value="Other">Other</option>
                </Select>
              </FormGroup>

              <FormGroup>
                <Label>Do you have the design files? <span style={{ color: 'red' }}>*</span></Label>
                <Select name="design-files" required>
                  <option value="">—Please choose an option—</option>
                  <option value="Yes">Yes</option>
                  <option value="No">No</option>
                </Select>
              </FormGroup>

              <FormGroup>
                <Label>Comments <span style={{ color: 'red' }}>*</span></Label>
                <Textarea name="comments" placeholder="Type a message here.." rows={4} required />
              </FormGroup>

              <div style={{ textAlign: 'right' }}>
                <SubmitButton type="submit">Submit</SubmitButton>
              </div>
            </form>
          </ModalContent>
        </ModalOverlay>
      )}
    </Section>
  );
};

export default ContactSalesSection;
