import React, { useState } from "react";
import styled, { keyframes } from "styled-components";
import TopNavigation from "./TopNavigation";
import Footer from "./Footer";
import { notification } from 'antd'

// Spinner animation
const spin = keyframes`
  to { transform: rotate(360deg); }
`;

// Styled Components
const Container = styled.div`
  display: flex;
  flex-direction: column;
  padding: 60px 20px;
  gap: 40px;

  @media (min-width: 768px) {
    flex-direction: row;
    padding: 80px 100px;
  }
`;

const Left = styled.div`
  flex: 1;
  display: flex;
  flex-direction: column;
  gap: 20px;
`;

const InfoBlock = styled.div`
  font-size: 1rem;
  color: #374151;

  strong {
    display: block;
    color: #111827;
    margin-bottom: 4px;
  }
`;

const Right = styled.form`
  flex: 1;
  display: flex;
  flex-direction: column;
  gap: 16px;
`;

const Input = styled.input`
  padding: 12px 14px;
  border: 1px solid #d1d5db;
  border-radius: 6px;
  font-size: 1rem;
  width: 100%;
`;

const TextArea = styled.textarea`
  padding: 12px 14px;
  border: 1px solid #d1d5db;
  border-radius: 6px;
  font-size: 1rem;
  width: 100%;
  resize: vertical;
  min-height: 120px;
`;

const Button = styled.button`
  background: #0369a1;
  color: white;
  padding: 12px 16px;
  border: none;
  border-radius: 6px;
  font-size: 1rem;
  cursor: pointer;
  width: 60%;
  margin: auto;
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 8px;

  &:hover {
    background: #024e7c;
  }

  &:disabled {
    background: #7caac4;
    cursor: not-allowed;
  }
`;

const Spinner = styled.div`
  border: 2px solid #fff;
  border-top: 2px solid transparent;
  border-radius: 50%;
  width: 16px;
  height: 16px;
  animation: ${spin} 0.8s linear infinite;
`;

const SuccessMessage = styled.p`
  color: green;
  font-weight: 500;
`;

const ErrorMessage = styled.p`
  color: red;
  font-weight: 500;
  font-size: 0.9rem;
  margin: -10px 0 10px;
`;

const ContactUs = () => {
  const [formData, setFormData] = useState({
    name: "",
    email: "",
    mobile: "",
    message: "",
  });

  const [status, setStatus] = useState({ success: null, message: "" });
  const [errors, setErrors] = useState({});
  const [loading, setLoading] = useState(false);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData((prev) => ({ ...prev, [name]: value }));
  };

  const validate = () => {
    const newErrors = {};

    if (!formData.name.trim()) {
      newErrors.name = "Name is required";
    } else if (formData.name.trim().length < 2) {
      newErrors.name = "Name must be at least 2 characters";
    }

    if (!formData.email.trim()) {
      newErrors.email = "Email is required";
    } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(formData.email)) {
      newErrors.email = "Invalid email address";
    }

    if (!formData.mobile.trim()) {
      newErrors.mobile = "Mobile number is required";
    } else if (!/^\d{10}$/.test(formData.mobile)) {
      newErrors.mobile = "Mobile number must be 10 digits";
    }

    if (!formData.message.trim()) {
      newErrors.message = "Message is required";
    } else if (formData.message.trim().length < 10) {
      newErrors.message = "Message must be at least 10 characters";
    }

    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    if (!validate()) return;

    setLoading(true);
    try {
      const res = await fetch("https://factory.demosite.name/api/Api/contactus", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(formData),
      });

      if (res.ok) {
        setStatus({ success: true });
        notification.success({
          message: 'Message sent successfully!',
          description : 'We will get back to you soon.',
          placement: 'topRight',
        });
        setFormData({ name: "", email: "", mobile: "", message: "" });
        setErrors({});
      } else {
        throw new Error("Failed to send message");
      }
    } catch (err) {
      setStatus({ success: false, message: err.message });
    } finally {
      setLoading(false);
    }
  };

  return (
    <>
      <TopNavigation />
      <Container>
        <Left>
          <InfoBlock>
            <strong>Address:</strong>
            123 Industrial Lane, Sector 21, Delhi, India
          </InfoBlock>
          <InfoBlock>
            <strong>Email:</strong>
            contact@digifactory.ae
          </InfoBlock>
          <InfoBlock>
            <strong>Contact Number:</strong>
            +91 9876543210
          </InfoBlock>
        </Left>

        <Right onSubmit={handleSubmit}>
          <Input
            name="name"
            placeholder="Your Name"
            value={formData.name}
            onChange={handleChange}
          />
          {errors.name && <ErrorMessage>{errors.name}</ErrorMessage>}

          <Input
            name="email"
            type="email"
            placeholder="Your Email"
            value={formData.email}
            onChange={handleChange}
          />
          {errors.email && <ErrorMessage>{errors.email}</ErrorMessage>}

          <Input
            type="number"
            name="mobile"
            placeholder="Your Mobile Number"
            value={formData.mobile}
            onChange={handleChange}
          />
          {errors.mobile && <ErrorMessage>{errors.mobile}</ErrorMessage>}

          <TextArea
            name="message"
            placeholder="Your Message"
            value={formData.message}
            onChange={handleChange}
          />
          {errors.message && <ErrorMessage>{errors.message}</ErrorMessage>}

          <Button type="submit" disabled={loading}>
            {loading ? (
              <>
                <Spinner />
                Sending...
              </>
            ) : (
              "Send Message"
            )}
          </Button>

          {status.message && (
            status.success ? (
              <SuccessMessage>{status.message}</SuccessMessage>
            ) : (
              <ErrorMessage>{status.message}</ErrorMessage>
            )
          )}
        </Right>
      </Container>
      <Footer />
    </>
  );
};

export default ContactUs;
