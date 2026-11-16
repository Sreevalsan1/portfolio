import { projects } from '../data/projects';

export default function ProjectsSection() {
  return (
    <section className="section" id="projects">
      <div className="container">
        <div className="section-heading">
          <span>Projects</span>
          <h2>Selected work and product experiments.</h2>
        </div>

        <div className="project-grid">
          {projects.map((project) => (
            <article key={project.title} className="project-card">
              <div className="project-visual" aria-label={`${project.title} preview`} />
              <h3>{project.title}</h3>
              <p>{project.description}</p>

              <div className="project-stack">
                {project.stack.map((item) => (
                  <span key={item}>{item}</span>
                ))}
              </div>

              <div className="project-links">
                <a className="link-pill" href={project.link}>
                  Live demo
                </a>
                <a className="link-pill" href={project.repo}>
                  Source
                </a>
              </div>
            </article>
          ))}
        </div>
      </div>
    </section>
  );
}
