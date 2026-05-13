export const metadata = {
  title: 'Agent Marketplace',
  description: 'Trusted marketplace for AI agents',
}; 

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang='en'>
      <body>{children}</body>
    </html>
  );
}
