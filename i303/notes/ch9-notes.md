## **Ch.9 - Systems Development and Project Management: Corporate Responsibility
### **The Systems Development Life Cycle (SDLC)**
- **Legacy System**: an old system that is fast approaching or beyond the end of its useful life within an organization
- **Conversion**: the process of transferring information from a legacy system to a new system
- **Software Customization**: modifies software to meet specific user or business requirements
- **Off-the-Shelf Application Software**: supports general business processes and does not require any specific software customization to meet the organization's needs
- **Systems Development Life Cycle (SDLC)**: the overall process for developing information systems, from planning and analysis through implementation and maintenance**
  - The foundation for all systems development methods, and hundreds of activities are associated with each phase.
  - These activities typically include determining budgets, gathering system requirements, and writing detailed user documentation
  - The SDLC begins with a business need, proceeds to an assessment of the functions a system must have to satisfy the need, and ends when the benefits of the system no longer outweigh its maintenance costs.
  - *This is why it is referred to as a life cycle. The SDLC is composed of seven distinct phases*: planning, analysis, design, development, testing, implementation, and maintenance
#### **Phase 1: Planning**
- The **planning phase** establishes a high-level plan of the intended project and determines project goals
- _Planning is the first and most critical phase of any systems development effort, regardless of whether the effort is to develop a system that allows customers to order products online, determine the best logistical structure for warehouses around the world, or develop a strategic information alliance with another organization._
- **Change Agent**: a person or event that is the catalyst for implementing major changes for a system to meet business changes
- **Brainstorming**: a technique for generating ideas by encouraging participants to offer as many ideas as possible in a short period without any analysis until all the ideas have been exhausted. Many times, new business opportunities are found as the result of a brainstorming session.
- The **Project Management Institute (PMI)** develops procedures and concepts necessary to support the profession of project management (www.pmi.org).
- PMI defines a **project** as a temporary activity a company undertakes to create a unique product, service, or result.
- **Project management**: is the application of knowledge, skills, tools, and techniques to project activities to meet project requirements.
- A **project manager** is an individual who is an expert in project planning and management, defines and develops the project plan, and tracks the plan to ensure that the project is completed on time and on budget.
- The **project scope** describes the business need (the problem the project will solve) and the justification, requirements, and current boundaries for the project.
- The **project plan** is a formal, approved document that manages and controls the entire project.
#### **Phase 2: Analysis**
- In the **analysis phase** the firm analyzes its end-user business requirements and refines project goals into defined functions and operations of the intended system. **Business requirements** are the specific business requests the system must meet to be successful, so the analysis phase is critical because business requirements drive the entire systems development effort.
  - A sample business requirement might state, “The CRM system must track all customer inquiries by product, region, and sales representative.” The business requirement will state what the system must accomplish to be considered successful
- **Requirements management** is the process of managing changes to the business requirements throughout the project.
  - Projects are typically dynamic in nature, and change should be expected and anticipated for successful project completion.
- A **requirements definition document** prioritizes all of the business requirements by order of importance to the company.
- **Sign-off** is the users' actual signatures indicating they approve all of the business requirements. 
-  **Process modeling** involves graphically representing the processes that capture, manipulate, store, and distribute information between a system and its environment. 
   -  One of the most common diagrams used in process modeling is the  flow diagram.
-  A **data flow diagram (DFD)** illustrates the movement of information between external entities and the processes and data stores within the system
-  **Computer-aided software engineering (CASE)** tools are software suites that automate systems analysis, design, and development.
   -  Process models and data flow diagrams can provide the basis for the automatic generation of the system if they are developed using a CASE tool.
#### **Phase 3: Design**
- The **design phase** estbalishes descripition features and operations of the system including screen layouts, business process diagrams, pseudocode, and other documentation.
- The **graphical user interface (GUI)** is the interface to an information system. GUI screen design is the ability to model the information system screens for an entire system by using icons, buttons, menus, and submenus. 
- Data models represent a formal way to express data relationships to a database management system (DBMS). 
  - Entity relationship diagrams document the relationships between entities in a database environment
#### **Phase 4: Development**
- The **development phase** transforms all the detailed design documents from the design phase into the actual system. In this phase, the project transitions from preliminary designs to actual physical implementation.
- **Software engineering** is a disciplined approach for constructing information systems through the use of common methods, techniques, or tools.
  - Software engineers use computer-aided software engineering (CASE) tools, which provide automated support for the development of the system. 
- **Control objects for information and related technology (COBIT)** is a set of best practices that helps an organization maximize the benefits of an information system, at the same time establishing appropriate controls to ensure minimum errors.
- A **scripting language** is a programming method that provides for interactive modules to a website. Object-oriented languages group data and corresponding processes into objects. 
- **Fourth-generation languages (4GL)** are programming languages that look similar to human languages. For example, a typical 4GL command might state, “FIND ALL RECORDS WHERE NAME IS ‘SMITH'.”
#### **Phase 5: Testing**
- The **testing phase** brings all the project pieces together into a special testing environment to eliminate errors and bugs and verify that the system meets all the business requirements defined in the analysis phase.
- **Bugs** are defects in the code of an information system. 
- **Test conditions** detail the steps the system must perform along with the expected result of each step
#### **Phase 6: Implementation**
- In the **implementation phase**, the organization places the system into production so users can begin to perform actual business operations with it. 
  - In this phase, the detailed **user documentation** is created that highlights how to use the system and how to troubleshoot issues or problems. 
- Training is also provided for the system users and can take place online or in a classroom.
- **Online training** runs over the Internet or on a CD or DVD, and employees complete the training on their own time at their own pace.
- **Workshop training** is held in a classroom environment and led by an instructor. 
- One of the best ways to support users is to create a **help desk** or a group of people who respond to users' questions
#### **Phase 7: Maintenance**
- Maintaining the system is the final sequential phase of any systems development effort. In the **maintenance phase**, the organization performs changes, corrections, additions, and upgrades to ensure that the system continues to meet business goals. 
- This phase continues for the life of the system because the system must change as the business evolves and its needs change, which means conducting constant monitoring, supporting the new system with frequent minor changes (for example, new reports or information capturing), and reviewing the system to be sure it is moving the organization toward its strategic goals. 
- **Corrective maintenance** makes system changes to repair design flaws, coding errors, or implementation issues. 
- **Preventive maintenance** makes system changes to reduce the chance of future system failure. During the maintenance phase, the system will generate reports to help users and MIS specialists ensure that it is functioning correctly
### **Software Development Methodology: The Waterfall**
- A **methodology** is a set of policies, procedures, standards, processes, practices, tools, techniques, and tasks that people apply to technical and management challenges.
  - Firms use a methodology to manage the deployment of technology with work plans, requirements documents, and test plans, for instance.
  - A formal methodology can include coding standards, code libraries, development practices, and much more.
- The oldest and the best known is the **waterfall methodology**, a sequence of phases in which the output of each phase becomes the input for the next
- **Prototyping** is a modern design approach by which the designers and system users use an iterative approach to building the system.
- **Discovery prototyping** builds a small-scale representation or working model of the system to ensure that it meets the user and business requirements.
  - The following are advantages of prototyping:
    - Prototyping encourages user participation.
    - Prototypes evolve through iteration, which supports change better.
    - Prototypes have a physical quality allowing users to see, touch, and experience the system as it is developed.
    - Prototypes tend to detect errors earlier.
    - Prototyping accelerates the phases of the SDLC, helping to ensure success.
### **Agile Software Development Methodologies**
- **Iterative development**: consists of a series of tiny projects. 
-  An **agile methodology** aims for customer satisfaction through early and continuous delivery of useful software components developed by an iterative process using the bare minimum requirements.
   -  Agile methodology is what it sounds like: fast and efficient, with lower costs and fewer features. Using agile methods helps refine feasibility and supports the process for getting rapid feedback as functionality is introduced.
#### **Rapid Application Development (RAD) Methodology**
- **Rapid application development (RAD) methodology** (also called rapid prototyping) emphasizes extensive user involvement in the rapid and evolutionary construction of working prototypes of a system, to accelerate the systems development process.
#### **Extreme Programming Methodologies**
- **Extreme programming (XP) methodology**, like other agile methods, breaks a project into four phases, and developers cannot continue to the next phase until the previous phase is complete. The delivery strategy supporting XP is that the quicker the feedback the more improved the results. XP has four basic phases: planning, designing, coding, and testing.
#### **Rational Unified Process (RUP) Methodology**
- The **rational unified process (RUP) methodology**, owned by IBM, provides a framework for breaking down the development of software into four gates.
  - Each gate consists of executable iterations of the software in development.
  - A project stays in a gate waiting for the stakeholder's analysis, and then it either moves to the next gate or is cancelled.
  - The gates include:
    - Gate one: inception. This phase ensures that all stakeholders have a shared understanding of the proposed system and what it will do.
    - Gate two: elaboration. This phase expands on the agreed-upon details of the system, including the ability to provide an architecture to support and build it.
    - Gate three: construction. This phase includes building and developing the product.
    - Gate four: transition. Primary questions answered in this phase address ownership of the system and training of key personnel.
#### **Scrum Methodology**
- Another agile methodology, **scrum methodology**, uses small teams to produce small pieces of software using a series of sprints, or 30-day intervals, to achieve an appointed goal.
  - In rugby, a scrum is a team pack and everyone in the pack works together to move the ball down the field. In scrum methodology, each day ends or begins with a stand-up meeting to monitor and control the development effort.
### **Developing a Service-Oriented Architecture**
- One of the latest trends in systems development is creating a service-oriented architecture. **Service-oriented architecture (SOA)** is a business-driven enterprise architecture that supports integrating a business as linked, repeatable activities, tasks, or services.
  - SOA ensures that MIS systems can adapt quickly, easily, and economically to support rapidly changing business needs. SOA promotes a scalable and flexible enterprise architecture that can implement new or reuse existing MIS components, creating connections among disparate applications and systems
#### **Service**
- Service-oriented architecture begins with a service—an SOA **service** being simply a business task, such as checking a potential customer's credit rating when opening a new account.
  - It is important to stress that this is part of a business process. Services are like software products; however, when describing SOA, do not think about software or MIS.
  - Think about what a company does on a day-to-day basis and break up those business processes into repeatable business tasks or components.
#### **Interoperability**
- As defined earlier, **interoperability** is the capability of two or more computer systems to share data and resources, even though they are made by different manufacturers
- A web service is an open-standards way of supporting interoperability. Web services are application programming interfaces (API) that can be accessed over a network, such as the Internet, and executed on a remote system hosting the requested services.
- Technically, web services are based on **Extensible Markup Language (XML)**, a markup language for documents, containing structured information. The technical specifics of XML's capabilities go beyond the scope of this book, but for our purposes, they support things such as ebusiness transactions, mathematical equations, and a thousand other kinds of structured data
#### **Loose Coupling**
- **Loose coupling** is the capability of services to be joined on demand to create composite services or disassembled just as easily into their functional components. Loose coupling is a way of ensuring that the technical details such as language, platform, and so on are decoupled from the service.
### **Using Project Management to Deliver Successful Projects**
- Tangible benefits are easy to quantify and typically measured to determine the success or failure of a project. Intangible benefits are difficult to quantify or measure
- Feasibility is the measure of the tangible and intangible benefits of an information system
- The Project Management Institute created the Project Management Body of Knowledge (PMBOK) for the education and certification of project managers.
- A **PERT (Program Evaluation and Review Technique)** chart is a graphical network model that depicts a project's tasks and the relationships between them.
- A **dependency** is a logical relationship that exists between the project tasks, or between a project task and a milestone. PERT charts define dependency between project tasks before those tasks are scheduled
- The **critical path** is the sequence of activities that determine the earliest date by which the project can be completed
- A **Gantt chart** is a simple bar chart that lists project tasks vertically against the project's time frame, listed horizontally.
  - A Gantt chart works well for representing the project schedule. It also shows actual progress of tasks against the planned duration
### **Outsourcing Projects**
- In-sourcing (in-house development) uses the professional expertise within an organization to develop and maintain its information technology systems. In-sourcing has been instrumental in creating a viable supply of IT professionals and in creating a better quality workforce combining both technical and business skills.
- Outsourcing is an arrangement by which one organization provides a service or services for another organization that chooses not to perform them in-house.
- Common reasons companies outsource include:
  - Core competencies. Many companies have recently begun to consider outsourcing as a way to acquire best-practices and the business process expertise of highly skilled technology resources for a low cost. Technology is advancing at such an accelerated rate that companies often lack the technical resources required to keep current.
  - Financial savings. It is far cheaper to hire people in China and India than pay the required salaries for similar labor in the United States.
  - Rapid growth. Firms must get their products to market quickly and still be able to react to market changes. By taking advantage of outsourcing, an organization can acquire the resources required to speed up operations or scale to new demand levels.
  - The Internet and globalization. The pervasive nature of the Internet has made more people comfortable with outsourcing abroad as India, China, and the United States become virtual neighbors.
- **Outsourcing Models**
  - Onshore outsourcing—engaging another company within the same country for services.
  - Nearshore outsourcing—contracting an outsourcing arrangement with a company in a nearby country. Often this country will share a border with the native country.
  - Offshore outsourcing—using organizations from developing countries to write code and develop systems. In offshore outsourcing the country is geographically far away.