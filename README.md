# IIoT Stack Deployment

## Project Goals

This project aims to:
- Quickly deploy Docker on an Ubuntu Server.
- Deploy a system of Industrial Internet of Things (IIoT) services as Docker containers.

## Features

- Automated Docker installation on Ubuntu Server.
- Scalable and modular architecture.
- Pre-configured IIoT services for rapid deployment.
  - Timebase Historian
  - Timebase Explorer
  - Timebase Simulator
  - Ignition Gateway
  - Postgres SQL
  - PG Admin Utility
  - Node-Red
  - HiveMQ 4 Enterprise

## Prerequisites

- Ubuntu Server (24.04 or later).
- Basic knowledge of Docker and containerization.

## Installation

1. Clone this repository from [GitHub](https://github.com/tonyupton/iiot-stack):
    ```bash
    git clone https://github.com/tonyupton/iiot-stack.git
    ```

2. Make shell scripts executable.
    ```bash
    cd iiot-stack
    sudo chmod +x *.sh
    ```

3. Install Docker. [Docker Docs](https://docs.docker.com/engine/install/ubuntu/):

   ```bash
   ./install_docker.sh
   ```

4. Restart machine.
    ```bash
    sudo reboot
    ```

5. Deploy the IIoT services:
    ```bash
    docker compose up -d
    ```

## Usage

- Access the deployed services via their respective endpoints.
- Modify the `docker-compose.yml` file to customize the services.

## Contributing

Contributions are welcome! Please submit a pull request or open an issue for any suggestions or improvements.

## License

This project is licensed under the [MIT License](LICENSE).
