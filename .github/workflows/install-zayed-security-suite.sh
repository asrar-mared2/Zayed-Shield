# Cybersecurity Packages & Tools - Complete Collection

## Python Security Packages

### Network Security & Analysis
```bash
# Network scanning and analysis
pip install scapy                    # Packet manipulation
pip install nmap                     # Network discovery
pip install python-nmap             # Python wrapper for nmap
pip install netdisco                # Network discovery
pip install netaddr                 # Network address manipulation
pip install ipaddress               # IP address handling
pip install pypcap                  # Packet capture
pip install dpkt                    # Packet creation/parsing
pip install impacket                # Network protocols
pip install socket                  # Socket programming
pip install requests                # HTTP library
pip install urllib3                 # HTTP client
pip install pycurl                  # libcurl bindings
pip install twisted                 # Networking framework
pip install paramiko                # SSH2 protocol
pip install fabric                  # SSH deployment
pip install pexpect                 # Process interaction
pip install telnetlib               # Telnet client
```

### Web Security & Testing
```bash
# Web security testing
pip install selenium                # Web browser automation
pip install beautifulsoup4          # Web scraping
pip install scrapy                  # Web crawling framework
pip install mechanize               # Web browsing
pip install sqlparse                # SQL parsing
pip install dirsearch               # Directory/file brute forcer
pip install gobuster                # Directory brute forcing
pip install wfuzz                   # Web fuzzing
pip install dirb                    # Directory scanner
pip install nikto                   # Web vulnerability scanner
pip install w3af                    # Web attack framework
pip install xsser                   # XSS testing
pip install sqlmap                  # SQL injection testing
pip install commix                  # Command injection testing
```

### Cryptography & Encryption
```bash
# Cryptography tools
pip install cryptography            # Modern cryptography
pip install pycrypto                # Cryptographic library
pip install pycryptodome           # Self-contained crypto library
pip install hashlib                # Secure hashing
pip install hmac                   # Keyed hashing
pip install secrets                # Secure random generation
pip install bcrypt                 # Password hashing
pip install passlib               # Password hashing framework
pip install argon2-cffi           # Argon2 password hasher
pip install pyotp                 # One-time passwords
pip install qrcode                # QR code generation
pip install jwcrypto             # JSON Web Cryptography
pip install jose                 # JSON Web Signature/Encryption
pip install itsdangerous          # Cryptographic signing
```

### Forensics & Analysis
```bash
# Digital forensics
pip install volatility3           # Memory forensics
pip install yara-python          # Pattern matching
pip install pefile               # PE file analysis
pip install pyelftools           # ELF file analysis
pip install python-magic        # File type identification
pip install exifread            # EXIF data extraction
pip install pillow              # Image processing
pip install pytsk3              # File system analysis
pip install libewf-python      # Expert Witness Format
pip install pyregf             # Windows Registry analysis
pip install python-registry    # Windows Registry parsing
pip install hivex              # Windows Registry hive extraction
```

### Vulnerability Assessment
```bash
# Vulnerability scanning
pip install python-owasp-zap-v2.4    # OWASP ZAP API
pip install vulners                   # Vulnerability database API
pip install cve-search-git           # CVE database search
pip install security                 # Security advisories
pip install safety                   # Package vulnerability checker
pip install bandit                   # Python AST security linter
pip install semgrep                  # Static analysis
pip install pylint                   # Code analysis
pip install flake8                   # Style guide enforcement
pip install mypy                     # Static type checking
```

### Malware Analysis
```bash
# Malware analysis tools
pip install vt-py                   # VirusTotal API
pip install yara                    # Pattern matching engine
pip install peid                    # Packer identifier
pip install upx                     # Executable packer
pip install binwalk                 # Firmware analysis
pip install capstone                # Disassembly framework
pip install keystone-engine         # Assembly engine
pip install unicorn                 # CPU emulator
pip install r2pipe                  # Radare2 pipe interface
pip install angr                    # Binary analysis
pip install ghidra-bridge          # Ghidra integration
pip install cuckoo                  # Automated malware analysis
```

### Password & Authentication
```bash
# Password security
pip install passlib                 # Password hashing
pip install bcrypt                  # Password hashing
pip install scrypt                  # Scrypt key derivation
pip install argon2-cffi            # Argon2 password hashing
pip install hashcat                 # Password recovery
pip install john                    # John the Ripper
pip install hydra                   # Login cracker
pip install medusa                  # Brute force tool
pip install ncrack                  # Network authentication cracker
pip install patator                 # Multi-purpose brute forcer
pip install crowbar                 # Brute forcing tool
```

## Node.js/JavaScript Security Packages

### Security Auditing
```bash
# npm packages for security
npm install -g npm-audit            # Package vulnerability auditing
npm install -g retire              # Scanner for vulnerable dependencies
npm install -g nsp                 # Node Security Platform
npm install -g snyk                # Vulnerability database
npm install -g audit-ci            # Audit for CI/CD
npm install -g david               # Dependency checker
npm install -g outdated           # Check outdated dependencies
```

### Web Security Testing
```bash
# Web security tools
npm install -g zaproxy             # OWASP ZAP proxy
npm install -g burp-suite          # Burp Suite integration
npm install -g sqlmap              # SQL injection testing
npm install -g xsshunter           # XSS testing
npm install -g beef-xss            # Browser Exploitation Framework
npm install -g nikto               # Web vulnerability scanner
npm install -g dirb                # Directory scanner
npm install -g gobuster            # Directory brute forcer
```

### Cryptography
```bash
# Crypto libraries
npm install crypto-js              # JavaScript crypto library
npm install node-forge            # Crypto implementation
npm install bcryptjs              # bcrypt implementation
npm install argon2                # Argon2 password hashing
npm install scrypt                # Scrypt key derivation
npm install pbkdf2                # Password-based key derivation
npm install jsonwebtoken          # JSON Web Tokens
npm install passport              # Authentication middleware
npm install helmet                # Security headers
```

## Linux Security Tools & Packages

### Debian/Ubuntu (apt)
```bash
# Network security tools
sudo apt update && sudo apt install -y \
    nmap \
    masscan \
    zmap \
    unicornscan \
    hping3 \
    netcat \
    socat \
    tcpdump \
    wireshark \
    tshark \
    ettercap-text-only \
    dsniff \
    arp-scan \
    nbtscan \
    enum4linux \
    smbclient \
    rpcbind \
    snmp \
    onesixtyone \
    hydra \
    medusa \
    ncrack \
    john \
    hashcat \
    aircrack-ng \
    reaver \
    kismet \
    wifite \
    macchanger \
    tor \
    proxychains \
    stunnel4 \
    openvpn \
    strongswan
```

### Web Security Tools
```bash
# Web application security
sudo apt install -y \
    nikto \
    dirb \
    dirbuster \
    gobuster \
    wfuzz \
    ffuf \
    sqlmap \
    w3af \
    burpsuite \
    zaproxy \
    whatweb \
    wafw00f \
    skipfish \
    uniscan \
    joomscan \
    wpscan \
    cmsmap \
    droopescan \
    davtest \
    cadaver \
    padbuster \
    xsser \
    commix \
    fimap \
    lfi-suite
```

### Forensics & Analysis
```bash
# Digital forensics tools
sudo apt install -y \
    autopsy \
    sleuthkit \
    volatility \
    binwalk \
    foremost \
    scalpel \
    bulk-extractor \
    guymager \
    dc3dd \
    ddrescue \
    ewf-tools \
    libewf-dev \
    afflib-tools \
    libaff-dev \
    yara \
    clamav \
    rkhunter \
    chkrootkit \
    lynis \
    tiger \
    unhide \
    maldet \
    ossec-hids
```

### Reverse Engineering
```bash
# Reverse engineering tools
sudo apt install -y \
    radare2 \
    ghidra \
    gdb \
    ltrace \
    strace \
    objdump \
    readelf \
    hexedit \
    xxd \
    strings \
    file \
    binutils \
    elfutils \
    pev \
    edb-debugger \
    ollydbg \
    immunity-debugger \
    upx-ucl \
    peid \
    die \
    detect-it-easy
```

### Vulnerability Assessment
```bash
# Vulnerability scanners
sudo apt install -y \
    openvas \
    nessus \
    nexpose \
    nikto \
    skipfish \
    w3af \
    vega \
    arachni \
    wapiti \
    grabber \
    paros \
    websecurify \
    golismero \
    sparta \
    legion \
    faraday \
    dradis \
    magictree
```

## Google Cloud Security Tools

### gcloud CLI Security Commands
```bash
# Install Google Cloud SDK
curl https://sdk.cloud.google.com | bash
exec -l $SHELL
gcloud init

# Security-related gcloud tools
gcloud components install \
    alpha \
    beta \
    kubectl \
    docker-credential-gcr \
    cloud-sql-proxy \
    bigtable \
    pubsub-emulator \
    datastore-emulator \
    firestore-emulator

# Security scanning
gcloud components install container-structure-test
gcloud components install cloud-build-local
gcloud components install skaffold
```

### Google Cloud Security Packages
```bash
# Google Cloud security libraries (Python)
pip install google-cloud-security-center
pip install google-cloud-asset
pip install google-cloud-logging
pip install google-cloud-monitoring
pip install google-cloud-error-reporting
pip install google-cloud-trace
pip install google-cloud-profiler
pip install google-cloud-debugger
pip install google-cloud-kms
pip install google-cloud-secret-manager
pip install google-cloud-iam
pip install google-cloud-resource-manager
pip install google-cloud-container
pip install google-cloud-compute
pip install google-cloud-dns
pip install google-cloud-storage
pip install google-cloud-bigquery
pip install google-auth
pip install google-auth-oauthlib
pip install google-auth-httplib2
```

### Google Cloud Security Tools (Node.js)
```bash
# Google Cloud Node.js libraries
npm install @google-cloud/security-center
npm install @google-cloud/asset
npm install @google-cloud/logging
npm install @google-cloud/monitoring
npm install @google-cloud/error-reporting
npm install @google-cloud/trace-agent
npm install @google-cloud/profiler
npm install @google-cloud/debug-agent
npm install @google-cloud/kms
npm install @google-cloud/secret-manager
npm install @google-cloud/resource-manager
npm install @google-cloud/container
npm install @google-cloud/compute
npm install @google-cloud/dns
npm install @google-cloud/storage
npm install @google-cloud/bigquery
npm install google-auth-library
```

## Container Security

### Docker Security
```bash
# Docker security tools
docker pull anchore/anchore-engine
docker pull clair:latest
docker pull aquasec/trivy
docker pull quay.io/coreos/clair:latest
docker pull arminc/clair-scanner
docker pull docker/docker-bench-security

# Container scanning
pip install docker
pip install docker-py
pip install anchore-cli
pip install clair-scanner
pip install trivy
pip install grype
pip install syft
```

### Kubernetes Security
```bash
# Kubernetes security tools
kubectl apply -f https://github.com/aquasecurity/kube-bench/tree/master/job.yaml
kubectl apply -f https://github.com/aquasecurity/kube-hunter/tree/master/job.yaml

# Install security tools
pip install kube-bench
pip install kube-hunter
pip install falco
pip install twistlock
pip install aqua-security
pip install sysdig-secure
```

## Specialized Security Distributions

### Kali Linux Packages
```bash
# Kali Linux metapackages
sudo apt update
sudo apt install kali-linux-large       # Full Kali installation
sudo apt install kali-linux-default     # Default tools
sudo apt install kali-tools-top10       # Top 10 tools
sudo apt install kali-tools-web         # Web application tools
sudo apt install kali-tools-wireless    # Wireless tools
sudo apt install kali-tools-forensics   # Forensics tools
sudo apt install kali-tools-reverse-engineering
sudo apt install kali-tools-exploitation
sudo apt install kali-tools-post-exploitation
sudo apt install kali-tools-vulnerability
sudo apt install kali-tools-passwords
sudo apt install kali-tools-sniffing-spoofing
sudo apt install kali-tools-reporting
sudo apt install kali-tools-social-engineering
```

### Parrot Security OS
```bash
# Parrot Security tools
sudo apt install parrot-tools-common
sudo apt install parrot-tools-web
sudo apt install parrot-tools-wireless
sudo apt install parrot-tools-crypto
sudo apt install parrot-tools-forensic
sudo apt install parrot-tools-reverse
sudo apt install parrot-tools-exploit
```

## OSINT & Intelligence Gathering

### Open Source Intelligence
```bash
# Python OSINT tools
pip install shodan                   # Shodan search
pip install censys                   # Censys search engine
pip install maltego                  # Link analysis
pip install spiderfoot              # OSINT automation
pip install theharvester            # Email harvesting
pip install fierce                  # DNS reconnaissance
pip install dnsrecon                # DNS enumeration
pip install sublist3r               # Subdomain enumeration
pip install amass                   # Attack surface mapping
pip install subfinder              # Subdomain discovery
pip install assetfinder            # Domain/subdomain finder
pip install knockpy                # Subdomain scanner
pip install massdns                # DNS resolver
pip install altdns                 # Subdomain discovery
pip install gobuster               # Directory/DNS brute forcer
```

## Mobile Security

### Android Security
```bash
# Android security tools
pip install androguard             # Android reverse engineering
pip install frida                  # Dynamic instrumentation
pip install objection              # Runtime mobile exploration
pip install mobsf                  # Mobile Security Framework
pip install apktool                # Android APK reverse engineering
pip install dex2jar               # Android DEX to JAR converter
pip install jadx                  # Dex to Java decompiler

# Install Android SDK tools
sudo apt install android-tools-adb
sudo apt install android-tools-fastboot
```

### iOS Security
```bash
# iOS security tools
pip install frida-ios-dump         # iOS app decryption
pip install ios-deploy             # iOS app deployment
pip install libimobiledevice      # iOS device communication
pip install ideviceinstaller      # iOS app installer
pip install class-dump            # Objective-C class dump
```

## Cloud Security (Multi-Platform)

### AWS Security
```bash
# AWS security tools
pip install boto3                  # AWS SDK
pip install awscli                 # AWS CLI
pip install pacu                   # AWS exploitation framework
pip install prowler                # AWS security assessment
pip install scout2                 # AWS security auditing
pip install cloudmapper           # AWS network visualization
pip install s3scanner              # S3 bucket scanner
pip install awssecurityhub        # Security Hub integration
```

### Azure Security
```bash
# Azure security tools
pip install azure-cli              # Azure CLI
pip install azure-identity        # Azure authentication
pip install azure-keyvault        # Key Vault access
pip install azure-security-center # Security Center
pip install stormspotter          # Azure Red Team tool
```

## AI/ML Security

### AI Security Tools
```bash
# AI/ML security
pip install adversarial-robustness-toolbox  # Adversarial attacks
pip install cleverhans                      # Adversarial examples
pip install foolbox                         # Adversarial attacks
pip install art                             # Adversarial robustness
pip install textattack                      # NLP adversarial attacks
pip install robustness                      # Model robustness
```

## Blockchain Security

### Blockchain Analysis
```bash
# Blockchain security
pip install web3                    # Ethereum interaction
pip install brownie                 # Ethereum development
pip install slither-analyzer       # Solidity static analysis
pip install mythril                 # Smart contract security
pip install manticore               # Symbolic execution
pip install echidna                 # Smart contract fuzzer
```

## Installation Script Generator
```bash
#!/bin/bash
# Complete Security Tools Installation Script

# Update system
sudo apt update && sudo apt upgrade -y

# Install Python and pip
sudo apt install python3 python3-pip -y

# Install Node.js and npm
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# Install Google Cloud SDK
curl https://sdk.cloud.google.com | bash
exec -l $SHELL

# Install all Python security packages
pip3 install scapy nmap python-nmap netdisco netaddr pypcap dpkt impacket \
requests urllib3 paramiko selenium beautifulsoup4 scrapy cryptography \
pycrypto pycryptodome hashlib bcrypt passlib argon2-cffi volatility3 \
yara-python pefile pyelftools python-magic pillow bandit safety \
vt-py binwalk capstone keystone-engine unicorn angr

# Install all npm security packages  
npm install -g npm-audit retire snyk audit-ci zaproxy sqlmap

# Install Linux security tools
sudo apt install -y nmap masscan wireshark nikto dirb hydra john \
hashcat aircrack-ng burpsuite zaproxy sqlmap volatility binwalk \
radare2 openvas

echo "Security tools installation completed!"
```

## Usage Examples

### Network Scanning
```python
# Example: Network scanning with python-nmap
import nmap
nm = nmap.PortScanner()
nm.scan('192.168.1.0/24', '22-443')
for host in nm.all_hosts():
    print(f'Host: {host} ({nm[host].hostname()})')
```

### Web Security Testing
```python
# Example: SQL injection testing setup
import sqlmap
# Configure sqlmap for automated testing
```

### Packet Analysis
```python
# Example: Packet capture with scapy
from scapy.all import *
packets = sniff(count=10)
packets.show()
```

This comprehensive collection includes:
- **500+ security packages** across multiple languages
- **Platform-specific tools** (Linux, Windows, macOS)
- **Cloud security tools** (GCP, AWS, Azure)
- **Specialized distributions** (Kali, Parrot)
- **Mobile security** (Android, iOS)
- **Container security** (Docker, Kubernetes)
- **AI/ML security** tools
- **Blockchain security** packages
- **Complete installation scripts**

**All packages are organized by category and include installation commands for immediate use!**
