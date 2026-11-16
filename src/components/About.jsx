export default function About() {
  return (
    <section className="section" id="about">
      <div className="container">
        <div className="section-heading">
          <span>About</span>
          <h2>Designing product experiences with clarity and momentum.</h2>
        </div>

        <div className="about-grid">
          <div className="panel">
            <p>
              I am a software developer and design-minded engineer who enjoys turning ideas into
              thoughtful digital products. My work sits at the intersection of coding, UI craft,
              and product strategy.
            </p>
            <ul className="feature-list">
              <li>Strong frontend fundamentals with modern React workflows.</li>
              <li>Attention to accessibility, responsive design, and polish.</li>
              <li>Comfortable working across user interfaces, APIs, and deployment pipelines.</li>
            </ul>
          </div>

          <div className="panel">
            <p>
              I enjoy building interfaces that are simple to use and memorable to experience. My goal
              is to create products that balance engineering precision with human-centered design.
            </p>
            <ul className="feature-list">
              <li>Fast iteration in Vite and React-based apps.</li>
              <li>Clean architecture for maintainable codebases.</li>
              <li>Focus on production-readiness and deployment reliability.</li>
            </ul>
          </div>
        </div>
      </div>
    </section>
  );
}
