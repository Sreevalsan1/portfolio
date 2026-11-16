export default function ContactSection() {
  return (
    <section className="section" id="contact">
      <div className="container">
        <div className="section-heading">
          <span>Contact</span>
          <h2>Let&apos;s collaborate on the next meaningful product.</h2>
        </div>

        <div className="contact-grid">
          <div className="panel contact-panel">
            <p>
              I&apos;m open to frontend engineering, product design collaboration, and thoughtful digital
              projects where user experience matters.
            </p>
            <ul className="contact-list">
              <li>Email: hello@sreevalsan.dev</li>
              <li>Location: India</li>
              <li>Availability: Open for freelance and product work</li>
            </ul>
          </div>

          <div className="panel contact-panel">
            <p>
              Whether you need a portfolio refresh, a polished product experience, or a fast-moving
              prototype, I&apos;d love to hear what you&apos;re building.
            </p>
            <div className="hero-actions">
              <a className="primary-btn" href="mailto:hello@sreevalsan.dev">
                Email me
              </a>
              <a className="secondary-btn" href="https://github.com" target="_blank" rel="noreferrer">
                GitHub
              </a>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
