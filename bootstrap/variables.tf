variable "project_name" {
  description = "프로젝트 이름 (예: myapp)."
  type        = string
}

variable "area" {
  description = "조직 내 영역 또는 팀 식별자 (예: platform)."
  type        = string
}

variable "environments" {
  description = "생성할 환경 목록 (예: [\"dev\", \"prod\"])."
  type        = list(string)
}

variable "region" {
  description = "AWS 리전."
  type        = string
  default     = "ap-northeast-2"
}
