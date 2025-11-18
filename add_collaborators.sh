#!/bin/bash

# Script to add collaborators to the repository
# Each collaborator will have "push" permission (can push to their branches)

# Get the repository name from git remote
REPO=$(gh repo view --json nameWithOwner -q .nameWithOwner)

if [ -z "$REPO" ]; then
    echo "Error: Could not determine repository. Make sure you're in a git repository with a GitHub remote."
    exit 1
fi

echo "Adding collaborators to repository: $REPO"
echo "Permission level: push (allows creating branches and pushing)"
echo ""

# Array of collaborators (username)
collaborators=(
    "dianrii"
    "LiyaWuDi"
    "aminaaa08"
    "Qurt1024"
    "alinani7254648"
    "realzere"
    "dontcallme112"
    "Kharchenko13"
    "omirbaevaaru00-spec"
    "bussyd3str0y3r69xxx"
    "sally77880"
    "AsunaUki"
    "niginarash"
    "iissiin"
    "danaa-zh"
    "Alliiyawa"
)

# Names for reference
names=(
    "Ким Диана Владимировна"
    "Батырбекова Дамелия Бауыржановна"
    "Белосанова Амина"
    "Салимова Лейла Фазоиловна"
    "Садыкова Алина"
    "Ермеккызы Зере"
    "Сапархан Жулдыз-Ай"
    "Харченко Александра"
    "Омирбаева Аружан"
    "Мажуга Екатерина Алексеевна"
    "Манаш Дария"
    "Анисимова Надежда"
    "Рашидова Нигина"
    "Исина Дария"
    "Жолдыбай Дана"
    "Ахметкожаева Алия"
)

success_count=0
fail_count=0

for i in "${!collaborators[@]}"; do
    username="${collaborators[$i]}"
    name="${names[$i]}"

    echo "Adding: $name ($username)..."

    if gh api \
        --method PUT \
        -H "Accept: application/vnd.github+json" \
        "/repos/$REPO/collaborators/$username" \
        -f permission='push' 2>/dev/null; then
        echo "  ✓ Successfully added $username"
        ((success_count++))
    else
        echo "  ✗ Failed to add $username"
        ((fail_count++))
    fi
done

echo ""
echo "========================================"
echo "Summary:"
echo "  Successfully added: $success_count"
echo "  Failed: $fail_count"
echo "========================================"
echo ""
echo "Note: Collaborators will receive an invitation email from GitHub."
echo "They need to accept the invitation to gain access."
