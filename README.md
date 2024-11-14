# RMAN-L0-L1-BACKUP

# Oracle Database Incremental Backup and Recovery with RMAN

## Project Overview
This project demonstrates how to use RMAN for incremental backups and database recovery in Oracle. The goal is to set up incremental backups to capture changes efficiently, simulate data loss, and recover the database to a consistent state using the latest backup data.

## Steps

### 1. Configure Incremental RMAN Backup
- **Set Up RMAN Configuration**  
  Start by configuring RMAN with a designated backup location and retention policy. Ensure that RMAN has the necessary permissions to access the backup directory.

- **Perform Initial Level 0 Backup**  
  Begin with a Level 0 backup, which serves as a complete baseline for the database. This backup will be used as the reference point for future incremental backups.

- **Verify Backup Completion**  
  After performing the Level 0 backup, check the backup status in RMAN to confirm successful completion.

### 2. Schedule and Run Incremental Level 1 Backups
- **Configure Level 1 Incremental Backups**  
  Schedule Level 1 backups, which only capture the changes since the previous backup (either Level 0 or Level 1). This approach helps reduce backup time and storage requirements.

- **Verify Incremental Backup Completion**  
  Regularly verify the success of Level 1 backups in RMAN to ensure all incremental data is being captured accurately.

### 3. Simulate Data Loss
- **Identify Data Files for Simulation**  
  Select specific data files or tablespaces to simulate data loss. This controlled failure scenario will demonstrate the restoration process.

- **Manually Remove Data Files**  
  Delete the chosen data files manually to create a data loss event, allowing RMAN to detect and address the missing files during recovery.

### 4. Perform RMAN Recovery
- **Use RMAN to Restore Missing Files**  
  Initiate the RMAN restore process to retrieve the missing or damaged data files from the incremental backups. RMAN will use the most recent backups to restore the database to its previous state.

### 5. Validate the Recovery
- **Check Data Integrity**  
  Run queries on the restored database to verify that all data is intact and the database is fully functional.
