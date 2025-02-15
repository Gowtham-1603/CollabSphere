import React from 'react';
import { render, screen } from '@testing-library/react';
import App from '../src/App';

// Test case: Check if the app renders the welcome message
test('renders welcome message', () => {
  render(<App />);
  const linkElement = screen.getByText(/Welcome to CollabSphere Frontend/i);
  expect(linkElement).toBeInTheDocument();
});

// Test case: Check if the app renders without crashing
test('renders without crashing', () => {
  render(<App />);
});