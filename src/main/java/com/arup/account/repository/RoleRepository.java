package com.arup.account.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.arup.account.model.Role;

public interface RoleRepository extends JpaRepository<Role, Long>{
}
