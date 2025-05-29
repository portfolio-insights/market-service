package main

import (
	"encoding/json"
	"net/http"
)

func GenerateError(w http.ResponseWriter, message string, statusCode int) {
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(statusCode)
	json.NewEncoder(w).Encode(map[string]string{
		"detail": message,
	})
}
